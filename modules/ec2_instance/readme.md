# **AWS EC2 Instance with IAM Instance Profile Terraform Module**

## **Summary**
This module creates an AWS EC2 instance with an associated IAM instance profile. It allows you to specify the AMI, instance type, subnet, security groups, SSH key, user data, and associated IAM role.

## **Variables**
- `region` (`string`): AWS region where the EC2 instance will be created. Default is `us-west-2`.
- `ami` (`string`): The ID of the AMI to use for the instance.
- `instance_type` (`string`): The type of the instance to start.
- `subnet_id` (`string`): The VPC Subnet ID where the instance will be launched.
- `instance_name` (`string`): The name to associate with the instance. Default is `example-instance`.
- `security_group_ids` (`list(string)`): List of security group IDs to associate with the EC2 instance. Default is `[]`.
- `user_data` (`string`): The user data to provide when launching the instance. Default is `""`.
- `key_name` (`string`): The name of an existing SSH key to associate with the IAM instance. Default is `null`.
- `role_name` (`string`): The name of the IAM role to associate with the IAM instance profile.

## **Outputs**
- `instance_id`: The ID of the EC2 instance.
- `instance_private_ip`: The private IP of the EC2 instance.

## **Example Usage**
```hcl
module "ec2_instance" {
  source = "[path_to_module]"

  ami               = "ami-0123456789abcdef0"
  instance_type     = "t2.micro"
  subnet_id         = "subnet-0123456789abcdef0"
  instance_name     = "my-ec2-instance"
  security_group_ids = ["sg-0123456789abcdef0"]
  user_data         = "#!/bin/bash\necho 'Hello, World!' > /var/www/html/index.html"
  key_name          = "my-ssh-key"
  role_name         = "my-iam-role"
}
