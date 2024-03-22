resource "aws_lb" "alb" {
  name                       = var.alb_name
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = var.alb_sg_id
  subnets                    = var.subnets_list
  enable_deletion_protection = false
  tags                       = var.tags_lb
  access_logs {
    bucket  = var.alb_s3_bucket_name
    prefix  = var.alb_s3_prefix
    enabled = var.alb_s3_logs_enabled
  }
}

resource "aws_lb_listener" "https_listener" {  
  load_balancer_arn  = aws_lb.alb.arn
  port               = var.alb_listener_port
  protocol           = var.alb_listener_protocol
  ssl_policy         = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn    = var.acm_certificate_arn
  tags               = var.tags_lb
  default_action {    
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}

resource "aws_lb_target_group" "alb_tg" {
  name     = var.alb_tg_name
  port     = var.alb_tg_port
  vpc_id   = var.vpc_id
  protocol = var.alb_tg_protocol
  target_type = "ip"
  health_check {
    path = var.alb_healthcheck_path
    protocol = var.alb_tg_protocol
  }
  tags = var.tags_tg
}

# Attach a WAF to the ALB
resource "aws_wafv2_web_acl_association" "web_acl_association_my_lb" {
  resource_arn = aws_lb.alb.arn
  web_acl_arn  = var.waf_arn
}