# **AWS Application Load Balancer Terraform Module**

## **Summary**
This module creates an AWS Application Load Balancer (ALB) along with its associated listener, target group, and integrates it with AWS WAF. The ALB distributes incoming application traffic across multiple targets, such as EC2 instances, in multiple Availability Zones.

## **Variables**
- `region` (`string`): AWS region where the ALB will be created. Default is `us-west-2`.
- `subnets_list` (`list(string)`): List of subnet IDs where the ALB will be created.
- `alb_sg_id` (`list(string)`): List of security groups to be attached to the ALB.
- `alb_name` (`string`): Name of the Application Load Balancer.
- `acm_certificate_arn` (`string`): ALB certificate ARN.
- `alb_listener_port` (`number`): The listening port for HTTPS ALB Listener.
- `alb_listener_protocol` (`string`): Listener protocol (e.g., HTTPS, TCP, HTTP).
- `alb_tg_name` (`string`): Name of the ALB target group.
- `alb_tg_port` (`string`): Port of the ALB target group.
- `alb_tg_protocol` (`string`): Protocol for the ALB target group.
- `vpc_id` (`string`): VPC ID where the ALB and its associated resources will be created.
- `alb_healthcheck_path` (`string`): Health check path for the target group.
- `tags` (`map(string)`): A map of tags to add to the ALB.
- `tags_tg_name` (`map(string)`): A map of tags to add to the ALB target group.
- `waf_arn` (`string`): ARN of the WAF to be integrated with the ALB. Default is `""`.
- `alb_s3_bucket_name` (`string`): AWS S3 bucket name for ALB logs storage.
- `alb_s3_prefix` (`string`): Prefix for storing the logs.
- `alb_s3_logs_enabled` (`bool`): Enable or disable logs being passed to S3.

## **Outputs**
- `lb_arn`: The ARN of the created ALB.
- `dns_name`: The DNS name of the created ALB.
- `lb_id`: The ID of the created ALB.
- `alb_vpc_id`: The VPC ID for the ALB.
- `name`: The name of the created ALB.
- `tg_name`: The name of the created ALB target group.

## **Example Usage**
```hcl
module "alb" {
  source = "[path_to_module]"

  region                = "us-west-2"
  subnets_list          = ["subnet-0123456789abcdef0", "subnet-abcdef0123456789a"]
  alb_sg_id             = ["sg-0123456789abcdef0"]
  alb_name              = "my-alb"
  acm_certificate_arn   = "arn:aws:acm:us-west-2:123456789012:certificate/abcd1234-a123-456a-a12b-a123b4cd56ef"
  alb_listener_port     = 443
  alb_listener_protocol = "HTTPS"
  alb_tg_name           = "my-alb-tg"
  alb_tg_port           = "80"
  alb_tg_protocol       = "HTTP"
  vpc_id                = "vpc-0123456789abcdef0"
  tags                  = { "Environment" = "prod" }
  tags_tg_name          = { "Name" = "my-alb-tg" }
  waf_arn               = "arn:aws:wafv2:us-west-2:123456789012:global/webacl/my-web-acl/abcd1234-a123-456a-a12b-a123b4cd56ef"
  alb_s3_bucket_name    = "my-alb-logs"
  alb_s3_prefix         = "logs"
  alb_s3_logs_enabled   = true
}
