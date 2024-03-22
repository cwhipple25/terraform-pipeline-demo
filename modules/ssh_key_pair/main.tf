data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}

locals {
  account_id          = data.aws_caller_identity.current.account_id
  partition           = data.aws_partition.current.partition
}

resource "random_string" "random" {
  length           = 8
  lower            = true
  upper            = false
  special          = false
}

resource "tls_private_key" "rsa_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.rsa_key.public_key_openssh
}

resource "aws_secretsmanager_secret" "private_key" {
  name                    = var.use_secret_name_randomizer ? "${var.key_pair_name}-${random_string.random.result}_private_key" : "${var.key_pair_name}"
  description             = var.description
  recovery_window_in_days = var.recovery_window_in_days
}

resource "aws_secretsmanager_secret_version" "private_key" {
  secret_id     = aws_secretsmanager_secret.private_key.id
  secret_string = tls_private_key.rsa_key.private_key_pem
}