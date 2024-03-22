resource "aws_lb_listener_rule" "path_rule" {
  count = var.alb_listener_rule_type == "PATH_BASED" ? 1 : 0
  listener_arn = var.listener_arn
  priority     = var.rule_priority
  action {
    type             = "forward"
    target_group_arn = var.path_rule_target_group_arn
  }

  condition {
    dynamic "path_pattern" {
      for_each = var.listener_rule_path_conditions != null ? [var.listener_rule_path_conditions] : []
      content {
        values = path_pattern.value
      }
    }
    
    # Other conditions (e.g., host-header) can go here if needed
  }
}

resource "aws_lb_listener_rule" "fixed_response_rule" {
  count = var.alb_listener_rule_type == "FIXED_RESPONSE" ? 1 : 0
  listener_arn = var.listener_arn
  priority     = var.rule_priority
  action {
    type = "fixed-response"
    fixed_response {
      content_type = var.fixed_response_content_type
      message_body = var.fixed_response_message_body
      status_code  = var.fixed_response_status_code
    }
  }
  condition {
    dynamic "path_pattern" {
      for_each = var.listener_rule_path_conditions != null ? [var.listener_rule_path_conditions] : []
      content {
        values = path_pattern.value
      }
    }
    
    # Other conditions (e.g., host-header) can go here if needed
  }
}
