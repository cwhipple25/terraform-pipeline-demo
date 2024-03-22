output "sg_rule_id" {
  description = "The security group rule ID"
  value       = aws_security_group_rule.sg_rule.id
}