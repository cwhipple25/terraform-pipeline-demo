variable "target_group_type" {
  description = "The type of target that you are registering with a target group."
  type        = string
  validation  {
    condition     = contains(["IP", "INSTANCE", "LAMBDA"], upper(var.target_group_type))
    error_message = "The target_group_type can only be 'IP/ip', 'INSTANCE/instance', or 'LAMBDA/lambda'."
  }
  default     = "ip" # Modify this if you want a different default value (e.g., "instance" or "lambda")
}

variable "target_name" {
  description = "The name of the target group."
  type        = string
}

variable "target_port" {
  description = "The port on which targets receive traffic."
  type        = number
}

variable "target_protocol" {
  description = "The protocol to use for routing traffic to the targets."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC in which to create the target group."
  type        = string
}

variable "alb_healthcheck_path" {
  description = "The destination for health checks on the targets. Relevant for ALB."
  type        = string
  default     = null
}

variable "health_check_protocol" {
  description = "The protocol for which the health check performs on"
  type        = string
  default     = null
}

variable "health_check_port" {
  description = "The port for which the health check performs on"
  type        = number
  default     = null
}

variable "health_check_healthy_threshold" {
  description = "Number of consecutive health check successes required before considering a target healthy. The range is 2-10."
  type        = number
  default     = 3
}

variable "health_check_unhealthy_threshold" {
  description = "Number of consecutive health check failures required before considering a target unhealthy. The range is 2-10."
  type        = number
  default     = 3
}

variable "health_check_interval" {
  description = "Approximate amount of time, in seconds, between health checks of an individual target. The range is 5-300."
  type        = number
  default     = 30
}

variable "health_check_timeout" {
  description = "Amount of time, in seconds, during which no response from a target means a failed health check. The range is 2-120 seconds."
  type        = number
  default     = null
}

variable "health_check_success_codes" {
  description = "Response codes to use when checking for a healthy responses from a target. Only applies to Application Load Balancers (i.e., HTTP/HTTPS/GRPC) not Network Load Balancers (i.e., TCP)."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {} # By default, no tags will be assigned.
}
