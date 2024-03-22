########################################## Begin CORE variables ####################################
project                 = "tf"
environment             = "dev"
context                 = "ec2demo"

# Spoke Stack Output: TerraformSpokeRoleARN
assume_role_arn         = "Placeholder_TerraformSpokeRoleARN"
########################################## End CORE variables ####################################


########################################## Begin RESOURCE variables ##########################################
security_group_vpc_id   = "Placeholder_VPC-ID"
instance_subnet_id      = "Placeholder_SUBNET-ID"
instance_ami            = "ami-093467ec28ae4fe03"
instance_type           = "t2.micro"
########################################## End RESOURCE variables ############################################