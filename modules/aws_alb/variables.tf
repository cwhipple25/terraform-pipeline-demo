variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "subnets_list" {
  type = list(string)
}

variable "alb_sg_id" {
  description = "List of security groups to be attached to the ALB"
  type = list(string)
}

variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type = string
}

variable "acm_certificate_arn" {
  description = "ALB certificate ARN"
  type = string
}

variable "alb_listener_port" {
  description = "Enter the value of the listening port for HTTPS ALB Listener"
  type = number
}

variable "alb_listener_protocol" {
  description = "Enter a vlaue for Listener protocol Eg: HTTPS, TCP, HTTP"
  type = string
}

variable "alb_tg_name" {
  description = "Value for the name of the ALB target group"
  type = string
}

variable "alb_tg_port" {
  description = "Value for the port of the ALB target group"
  type = string
}

variable "alb_tg_protocol" {
  description = "Value for the protocol for the ALB target group"
  type = string
}

variable "vpc_id" {
  description = "Value for the VPC ID"
  type = string
}

variable "alb_healthcheck_path" {
  description = "Value for health check on the target group"
  type = string
}

variable "tags_lb" {
  description = "A map of tags to add to the load balancer"
  type        = map(string)
  default     = {}
}

variable "tags_tg" {
  description = "A map of tags to add to the target group"
  type        = map(string)
  default     = {}
}

variable "waf_arn" {
  description = "ARN of the WAF to be integrated with the ALB"
  type        = string
  default     = ""
}

variable "alb_s3_bucket_name" {
  description = "AWS S3 bucket name for ALB logs to be stored"
  type = string
}

variable "alb_s3_prefix"{
  description = "Prefix to store the logs with"
  type = string
}

variable "alb_s3_logs_enabled" {
  description = "Enter true to enable logs being passed to S3 or false"
  type = bool
}