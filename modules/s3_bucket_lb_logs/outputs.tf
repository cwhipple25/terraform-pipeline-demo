output "arn" {
  description = "ARN of the bucket"
  value       = aws_s3_bucket.bucket.arn
}

output "name" {
  description = "Name of the bucket"
  value       = aws_s3_bucket.bucket.id
}