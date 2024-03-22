variable "alb_listener_rule_type" {
  description = "Type of ALB listener rule. Can be PATH or FIXED."
  type        = string
  validation  {
    condition     = contains(["PATH_BASED", "FIXED_RESPONSE"], upper(var.alb_listener_rule_type))
    error_message = "The alb_listener_rule_type can only be 'PATH_BASED/path_based' or 'FIXED_RESPONSE/fixed_response'."
  }
}

variable "rule_priority" {
  description = "Priority for the path-based listener rule."
  type        = number
}

variable "listener_arn" {
  description = "The ARN of the load balancer listener to which to attach the rule."
  type        = string
}

variable "path_rule_target_group_arn" {
  description = "The ARN of the target group to forward to when the PATH rule is matched."
  type        = string
  default     = null  # Optional, depending on whether you want to have a default or not.
}

# For the fixed-response rule
variable "fixed_response_content_type" {
  description = "The type of fixed response. Valid values are text/plain, text/css, text/html, application/javascript, application/json."
  type        = string
  default     = null
}

variable "fixed_response_message_body" {
  description = "The message body for the fixed response."
  type        = string
  default     = null
}

variable "fixed_response_status_code" {
  description = "The HTTP response status code for the fixed response."
  type        = string
  default     = null
}

variable "listener_rule_path_conditions" {
  description = "Condition for the listener rule"
  type = list(string)
  default = null
}
