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

resource "aws_lb_target_group" "lb_tg" {
  target_type = var.target_group_type
  name        = var.target_name
  port        = var.target_port
  protocol    = var.target_protocol
  vpc_id      = var.vpc_id
  
  health_check {
    path                             = var.alb_healthcheck_path
    protocol                         = var.health_check_protocol
    port                             = var.health_check_port
    healthy_threshold                = var.health_check_healthy_threshold
    unhealthy_threshold              = var.health_check_unhealthy_threshold
    interval                         = var.health_check_interval
    timeout                          = var.health_check_timeout
    matcher                          = var.health_check_success_codes
  }

  tags = var.tags
}
