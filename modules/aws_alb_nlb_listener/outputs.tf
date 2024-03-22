output "alb_listener_arn" {
  description = "The ARN of the ALB listener."
  value       = try(aws_lb_listener.alb_listener[0].arn, "")
  depends_on  = [aws_lb_listener.alb_listener]
}

output "nlb_listener_arn" {
  description = "The ARN of the NLB listener."
  value       = try(aws_lb_listener.nlb_listener[0].arn, "")
  depends_on  = [aws_lb_listener.nlb_listener]
}