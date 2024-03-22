variable "from_port" {
  description = "The starting (lowest) port for the security group rule"
  type        = number
}

variable "to_port" {
  description = "The ending (highest) port for the security group rule"
  type        = number
}

variable "protocol" {
  description = "The protocol for the security group rule"
  type        = string
}

variable "source_security_group_id" {
  description = "The ID of the source security group"
  type        = string
  default     = ""
}

variable "security_group_id" {
  description = "The ID of the security group to attach the rule to"
  type        = string
  default     = null
}

variable "cidr_blocks" {
  description = "List of CIDR blocks for the rule"
  type        = list(string)
  default     = null
}

variable "type" {
  description = "Type of rule, ingress (inbound) or egress (outbound)"
  type        = string
  default     = "ingress"
}

variable "description" {
  description = "The description of the security group rule"
  type        = string
  default     = "Security group managed by Terraform"
}