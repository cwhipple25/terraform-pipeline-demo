variable "key_pair_name" {
  description = "Name of the key pair"
  type        = string
}

variable "recovery_window_in_days" {
  description = "Number of days that AWS Secrets Manager waits before it can delete the secret. This value can be 0 to force deletion without recovery or range from 7 to 30 days. The default value is 30"
  type        = number
  default     = 30
}

variable "use_secret_name_randomizer" {
  type        = bool
  default     = false
}

variable "description" {
  description = "Description of the secret."
  type = string
  default = null
}