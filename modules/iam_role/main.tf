locals {
  role_name = var.iam_role_name_suffix_randomizer == true ?  "${var.iam_role_name}-${random_string.random.result}" : var.iam_role_name
}

data "aws_iam_policy_document" "assume_role_policy" {
  count = length(var.service_principals) > 0 ? 1 : 0
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = var.service_principals
    }

    effect = "Allow"
  }
}

resource "random_string" "random" {
  length           = 8
  lower            = true
  upper            = false
  special          = false
}

resource "aws_iam_role" "iam_role" {
  name               = local.role_name
  assume_role_policy = length(var.service_principals) > 0 ? data.aws_iam_policy_document.assume_role_policy[0].json : null
  description        = var.iam_role_description
}

resource "aws_iam_role_policy_attachment" "policy_attachment" {
  count      = var.ignore_policy_attachment_changes ? 0 : length(var.policy_arns)
  role       = aws_iam_role.iam_role.name
  policy_arn = var.policy_arns[count.index]
}

resource "aws_iam_role_policy_attachment" "policy_attachment_ignore_changes" {
  count      = var.ignore_policy_attachment_changes ? length(var.policy_arns) : 0
  role       = aws_iam_role.iam_role.name
  policy_arn = var.policy_arns[count.index]

  lifecycle {
    ignore_changes = [role, policy_arn]
  }
}

resource "aws_iam_instance_profile" "iam_instance_profile" {
  count = var.create_instance_profile ? 1 : 0
  name  = "${local.role_name}-instance-profile"
  role  = aws_iam_role.iam_role.name
}