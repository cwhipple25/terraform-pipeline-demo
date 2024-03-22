########################################## Begin RESOURCE variables ##########################################
variable "security_group_vpc_id" {
  description = "The VPC to create the security group in"
  type        = string
}

variable "instance_ami" {
  description = "The AMI used to create the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type of the EC2 instance"
  type        = string
}

variable "instance_subnet_id" {
  description = "The subnet id to place the EC2 instance"
  type        = string
}
########################################## End RESOURCE variables ############################################


########################################## BASELINE: Begin CORE variables ####################################

variable "assume_role_arn" {
  type = string
}

variable "aws_region" {
  default = "us-west-2"
}

variable "aws_service" {
  default = "aws"
}

variable "project" {
  description = "Project or the workload name for naming convention"
  type        = string
}

variable "environment" {
  description = "Deployment environment for naming convention"
  type        = string
}

variable "context" {
  description = "Context of the resources to be created for naming convention"
  type        = string
}
########################################## BASELINE: End CORE variables ######################################


########################################## BASELINE: Start DEFAULT RESOURCE TAG variables ####################
  variable "tag_DataClassification" {
    type = string
    default = "sensitive"
  }
  variable "tag_Division" {
    type = string
    default = "isd"
  }
  variable "tag_SupportContact" {
    type = string
    default = "support@org.com"
  }
  variable "tag_Requestor" {
    type = string
    default = "support@org.com"
  }
  variable "tag_Unit" {
    type = string
    default = "Cloud Team"
  }
  variable "tag_FundAuth" {
    type = string
    default = "Cloud"
  }
  variable "tag_ManagedBy" {
    type = string
    default = "Terraform"
  }
########################################## BASELINE: End DEFAULT RESOURCE TAG variables ######################