data "aws_caller_identity" "current" {}
locals {
  naming_prefix = "${var.project}-${var.environment}-${var.context}"
}

########################################## Deployment using Module calls in project ##########################################

module "security_group" {
  source = "../../modules/security_group"

  name        = "${local.naming_prefix}-sg"
  description = "Security group for ec2 instnace"
  vpc_id      = var.security_group_vpc_id
}

module "security_group_rule" {
  source = "../../modules/security_group_rule"

  security_group_id        = module.security_group.security_group_id  
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  cidr_blocks              = ["0.0.0.0/0"]
  type                     = "egress"
  description              = "Allow SSH traffic from anywhere"
}

module "iam_role" {
  source = "../../modules/iam_role"

  iam_role_name                    = "${local.naming_prefix}-role"
  iam_role_name_suffix_randomizer  = false
  iam_role_description             = "Role for my application"
  service_principals               = ["ec2.amazonaws.com"]
  policy_arns                      = ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]
  ignore_policy_attachment_changes = false
  create_instance_profile          = true 
}


## Commented out for brevity
# module "ec2_instance" {
#   source = "../../modules/ec2_instance"

#   ami                   = var.instance_ami
#   instance_type         = var.instance_type
#   subnet_id             = var.instance_subnet_id
#   instance_name         = "${local.naming_prefix}-instance"
#   security_group_ids    = [module.security_group.security_group_id]
#   instance_profile_name = module.iam_role.iam_instance_profile_name
#   user_data             = "#!/bin/bash\necho 'Hello, World!' > /var/www/html/index.html"
# }



########################################## Deployment using Resources directly in project ##########################################

# resource "aws_security_group" "instance_sg" {
#   name        = "${local.naming_prefix}-sg"
#   description = "Allow SSH"

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "${local.naming_prefix}-security-group"
#   }
# }


# resource "aws_iam_role" "instance_role" {
#   name = "${local.naming_prefix}-role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Action = "sts:AssumeRole",
#         Effect = "Allow",
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       },
#     ]
#   })
# }

# resource "aws_iam_policy_attachment" "ssm_policy_attachment" {
#   name       = "${local.naming_prefix}-ssm-policy-attachment"
#   roles      = [aws_iam_role.instance_role.name]
#   policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
# }

# resource "aws_iam_instance_profile" "instance_profile" {
#   name = "${local.naming_prefix}-profile"
#   role = aws_iam_role.instance_role.name
# }

# resource "aws_instance" "instance" {
#   ami           = var.instance_ami
#   instance_type = var.instance_type
#   security_groups = [aws_security_group.instance_sg.name]
#   iam_instance_profile = aws_iam_instance_profile.instance_profile.name
#   tags = {
#     Name = "${local.naming_prefix}-instance"
#   }
# }
