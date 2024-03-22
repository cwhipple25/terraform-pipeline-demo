output "target_group_arn" {
  description = "The ARN of the target group."
  value       = aws_lb_target_group.lb_tg.arn
}

output "target_group_name" {
  description = "The name of the target group."
  value       = aws_lb_target_group.lb_tg.name
}

output "target_group_port" {
  description = "The port on which targets receive traffic."
  value       = aws_lb_target_group.lb_tg.port
}

output "target_group_protocol" {
  description = "The protocol used for routing traffic to the targets."
  value       = aws_lb_target_group.lb_tg.protocol
}

output "target_group_type" {
  description = "The type of target that is registered with the target group."
  value       = aws_lb_target_group.lb_tg.target_type
}