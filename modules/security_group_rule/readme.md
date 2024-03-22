# **AWS Security Group Rule Terraform Module**

## **Summary**
This module creates a security group rule in AWS. It provides flexibility to specify ingress or egress rules, define port ranges, and set source CIDR blocks or security groups.

## **Variables**
- `from_port` (`number`): The starting (lowest) port for the security group rule.
- `to_port` (`number`): The ending (highest) port for the security group rule.
- `protocol` (`string`): The protocol for the security group rule.
- `source_security_group_id` (`string`): The ID of the source security group. Default is `""`.
- `security_group_id` (`string`): The ID of the security group to attach the rule to. Default is `null`.
- `cidr_blocks` (`list(string)`): List of CIDR blocks for the rule. Default is `null`.
- `type` (`string`): Type of rule, ingress (inbound) or egress (outbound). Default is `ingress`.
- `description` (`string`): The description of the security group rule. Default is "Security group managed by Terraform".

## **Outputs**
- `sg_rule_id`: The security group rule ID.

## **Example Usage**
```hcl
module "security_group_rule" {
  source = "[path_to_module]"

  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = "sg-0123456789abcdef0"
  security_group_id        = "sg-abcdef0123456789a"
  cidr_blocks              = ["0.0.0.0/0"]
  type                     = "ingress"
  description              = "Allow HTTP traffic from anywhere"
}
