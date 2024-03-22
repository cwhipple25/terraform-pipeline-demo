output "lb_arn" {
  description = "The ID and ARN of the load balancer we created"
  value       = try(aws_lb.alb.arn, "")
}

output "dns_name" {
  description = "The DNS of the load balancer we created"
  value       = try(aws_lb.alb.dns_name, "")
}

output "lb_id" {
  description = "The ID for the load balanacer being created"
  value       = try(aws_lb.alb.id, "")
}

output "alb_vpc_id" {
  description = "The VPC ID for the ALB"
  value = try(aws_lb.alb.vpc_id)
}

output "name" {
  description = "The name of the ALB"
  value =  try(aws_lb.alb.name) 
}

output "tg_name" {
  description = "The name of the ALB TG"
  value =  try(var.alb_tg_name) 
}

