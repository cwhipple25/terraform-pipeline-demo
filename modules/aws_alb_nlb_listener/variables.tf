variable "load_balancer_type" {
  description = "The type of load balancer, either 'ALB' or 'NLB'."
  type        = string
  validation  {
    condition     = contains(["ALB", "NLB"], upper(var.load_balancer_type))
    error_message = "The load_balancer_type can only be 'ALB/alb' or 'NLB/nlb'."
  }
}

variable "lb_arn" {
  description = "The ARN of the Application or Network Load Balancer."
  type        = string
}

variable "target_group_arn" {
  description = "The ARN of the target group to associate with the listener."
  type        = string
}

variable "lb_listener_port" {
  description = "The port for the ALB listener."
  type        = number
}

variable "lb_listener_protocol" {
  description = "The protocol for the ALB or NLB listener."
  type        = string
}

variable "acm_certificate_arn" {
  description = "The ARN of the ACM certificate."
  type        = string
  default     = null
}

variable "ssl_policy" {
  description = "The SSL policy."
  type        = string
  default     = "ELBSecurityPolicy-TLS13-1-2-2021-06"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {} # By default, no tags will be assigned.
}
