# **AWS Security Group Terraform Module**

## **Summary**
This module creates a security group in AWS. It allows you to specify the name, description, VPC ID, and tags for the security group.

## **Variables**
- `name` (`string`): The name of the security group.
- `description` (`string`): The description of the security group. Default is "Security group managed by Terraform".
- `vpc_id` (`string`): The VPC ID where the security group will be created.
- `tags` (`map(string)`): A map of tags to add to the security group. Default is `{}`.

## **Outputs**
- `security_group_id`: The ID of the security group.

## **Example Usage**
```hcl
module "security_group" {
  source = "[path_to_module]"

  name        = "my-security-group"
  description = "My custom security group"
  vpc_id      = "vpc-0123456789abcdef0"
  tags        = {
    "Environment" = "Production"
    "ManagedBy"   = "Terraform"
  }
}
