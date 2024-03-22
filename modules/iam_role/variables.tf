variable "iam_role_name" {
  description = "Name of the IAM role to be created"
  type        = string
}

variable "iam_role_description" {
  description = "Description of the IAM role to be created"
  type        = string
}

variable "policy_arns" {
  description = "List of IAM Policy ARNs to attach to the IAM Role"
  type        = list(string)
  default     = []
}

variable "service_principals" {
  description = "List of services for the IAM Role's Assume Role Trust Policy"
  type        = list(string)
  default     = []
}

variable "iam_role_name_suffix_randomizer" {
  description = ""
  type = bool
}

variable "ignore_policy_attachment_changes" {
  description = "Whether to ignore changes to policy ARNs in IAM role policy attachments"
  type        = bool
  default     = false
}

variable "create_instance_profile" {
  description = "Whether to create an IAM instance profile."
  type        = bool
  default     = false
}
