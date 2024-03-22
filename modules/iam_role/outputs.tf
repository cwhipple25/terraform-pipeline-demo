output "iam_role_arn" {
  description = "ARN of IAM role"
  value       = try(aws_iam_role.iam_role.arn, "")
}

output "iam_role_name" {
  description = "Name of IAM role"
  value       = try(aws_iam_role.iam_role.name, "")
}

output "iam_role_path" {
  description = "Path of IAM role"
  value       = try(aws_iam_role.iam_role.path, "")
}

output "iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value       = try(aws_iam_role.iam_role.unique_id, "")
}

output "iam_instance_profile_arn" {
  description = "The ARN of the IAM instance profile, if created."
  value       = var.create_instance_profile ? aws_iam_instance_profile.iam_instance_profile[0].arn : ""
}

output "iam_instance_profile_name" {
  description = "The Name of the IAM instance profile, if created."
  value       = var.create_instance_profile ? aws_iam_instance_profile.iam_instance_profile[0].name : ""
}
