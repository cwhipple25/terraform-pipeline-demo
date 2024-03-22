output "private_key" {
  description = "The generated RSA private key"
  value       = tls_private_key.rsa_key.private_key_pem
  sensitive   = true
}

output "public_key" {
  description = "The generated RSA public key (OpenSSH format)"
  value       = tls_private_key.rsa_key.public_key_openssh
}

output "key_pair_name" {
  description = "The name of the generated AWS key pair"
  value       = aws_key_pair.generated_key.key_name
}

output "secretsmanager_secret_arn" {
  description = "The ARN of the AWS Secrets Manager secret"
  value       = aws_secretsmanager_secret.private_key.arn
}