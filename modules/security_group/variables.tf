variable "name" {
  description = "The name of the security group"
  type        = string
}

variable "description" {
  description = "The description of the security group"
  type        = string
  default     = "Security group managed by Terraform"
}

variable "vpc_id" {
  description = "The VPC ID where the security group will be created"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to the security group"
  type        = map(string)
  default     = {}
}
