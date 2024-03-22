# data "aws_default_tags" "provider_tags" {}

# locals {
#   # Extract default_tags from the data source
#   default_tags = data.aws_default_tags.provider_tags.tags

#   # Merge default tags with custom tags for launch template
#   merged_tags = merge(
#     local.default_tags,
#     var.tags
#   )
# }

resource "aws_lb_listener" "alb_listener" {
  count               = var.load_balancer_type == "ALB" ? 1 : 0
  load_balancer_arn   = var.lb_arn
  port                = var.lb_listener_port
  protocol            = var.lb_listener_protocol
  
  ssl_policy          = var.lb_listener_protocol == "TLS" ? var.ssl_policy : null
  certificate_arn     = var.lb_listener_protocol == "TLS" ? var.acm_certificate_arn : null

  default_action {
    type              = "forward"
    target_group_arn  = var.target_group_arn
  }
  tags = var.tags
}

resource "aws_lb_listener" "nlb_listener" {
  count               = var.load_balancer_type == "NLB" ? 1 : 0
  load_balancer_arn   = var.lb_arn
  port                = var.lb_listener_port
  protocol            = var.lb_listener_protocol
  ssl_policy          = var.lb_listener_protocol == "TLS" ? var.ssl_policy : null
  # Certificate is only applied when using TLS for NLB.
  certificate_arn     = var.lb_listener_protocol == "TLS" ? var.acm_certificate_arn : null

  default_action {
    type              = "forward"
    target_group_arn  = var.target_group_arn
  }
  tags = var.tags
}