variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "use_string_randomizer" {
  type        = bool
  default     = false
}

variable "lb_type" {
  description = "Should either be 'alb' -or- 'nlb'"
  type  = string
}

variable "prefix" {
  type = string
  default = null
}

variable "force_destroy" {
  type = bool
  default = false
}