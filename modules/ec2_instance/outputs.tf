output "instance_id" {
  description = "The ID of the instance"
  value       = aws_instance.ec2.id
}

output "instance_private_ip" {
  description = "The private IP of the instance"
  value       = aws_instance.ec2.private_ip
}