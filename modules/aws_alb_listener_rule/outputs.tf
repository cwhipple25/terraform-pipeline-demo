output "path_rule_arn" {
  description = "The ARN of the path-based listener rule."
  value       = try(aws_lb_listener_rule.path_rule[0].arn, null)
  depends_on  = [aws_lb_listener_rule.path_rule]
}

output "fixed_response_rule_arn" {
  description = "The ARN of the fixed-response listener rule."
  value       = try(aws_lb_listener_rule.fixed_response_rule[0].arn, null)
  depends_on  = [aws_lb_listener_rule.fixed_response_rule]
}
