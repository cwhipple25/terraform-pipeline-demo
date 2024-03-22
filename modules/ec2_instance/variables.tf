variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "ami" {
  description = "The ID of the AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of the instance to start"
  type        = string
}

variable "subnet_id" {
  description = "The VPC Subnet ID"
  type        = string
}

variable "instance_name" {
  description = "The name to associate with the instance"
  type        = string
  default     = "example-instance"
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the EC2 instance"
  type        = list(string)
  default     = []
}

variable "user_data" {
  description = "The user data to provide when launching the instance"
  type        = string
  default     = null
}

variable "key_name" {
  description = "The name of an existing SSH key to associate with the IAM instance."
  type        = string
  default     = null
}

variable "role_name" {
  description = "The name of the IAM role to associate with the IAM instance profile."
  type        = string
  default     = null
}

variable "instance_profile_name" {
  description = "The name of the instance profile associate with the EC2 instance. Overwrites Role Name"
  type        = string
}

variable "root_volume_size" {
  description = "The size of the root volume in gibibytes (GiB)."
  type        = number
  default     = 8  # You can adjust this default value or remove it entirely to make the variable mandatory.
}

variable "delete_on_termination" {
  description = "Indicates whether the EBS volume should be destroyed on instance termination."
  type        = bool
  default     = true
}