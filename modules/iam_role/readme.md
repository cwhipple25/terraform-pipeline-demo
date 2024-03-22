# **AWS IAM Role Terraform Module**

## **Summary**
This module creates an AWS Identity and Access Management (IAM) role and attaches specified policies to it. The role can be assumed by specified AWS services. The module allows for customization of the role name, description, and the services that can assume the role. Additionally, this module can dynamically manage the application of IAM policy attachments or set them in a manner that ignores future changes to the attachments, depending on the `ignore_policy_attachment_changes` variable.

## **Variables**
- `iam_role_name` (`string`): The base name of the IAM role.
- `iam_role_name_suffix_randomizer` (`bool`): Whether to append a random string to the IAM role name for uniqueness. Default is not provided.
- `iam_role_description` (`string`): Description for the IAM role.
- `service_principals` (`list(string)`): List of AWS service principals that can assume the role. For example, `["ec2.amazonaws.com"]` allows EC2 instances to assume the role.
- `policy_arns` (`list(string)`): List of AWS IAM policy ARNs to attach to the role.
- `ignore_policy_attachment_changes` (`bool`): Whether to ignore changes to policy attachments after initial creation. Default is `false`.
- `create_instance_profile` (`bool`): Whether to create an instance profile for this role or not. Default is `false`.

## **Best Practices**
- Modifying the `ignore_policy_attachment_changes` variable after the resources have been created can cause disruptions. When toggled, Terraform may destroy and recreate IAM role policy attachments, leading to potential downtime or unintended permission changes while the `apply` is occuring.
- It is recommended to decide the desired behavior of `ignore_policy_attachment_changes` during the initial setup and avoid altering it frequently to prevent unnecessary resource churn and to maintain consistency in the IAM role configurations.
- If possible, set and finalize the value of `ignore_policy_attachment_changes` before deploying to production environments to avoid disruption in services due to permission changes. However, it is possible to toggle the value back-and-forth, but please take the above into consideration.

## **Outputs**
- `iam_role_arn`: The Amazon Resource Name (ARN) of the IAM role.
- `iam_role_name`: The name of the IAM role.
- `iam_role_path`: The path of the IAM role.
- `iam_role_unique_id`: The unique ID of the IAM role.

## **Example Usage**
```hcl
module "iam_role" {
  source = "[path_to_module]"

  iam_role_name                    = "my-app-role"
  iam_role_name_suffix_randomizer  = true
  iam_role_description             = "Role for my application"
  service_principals               = ["ec2.amazonaws.com"]
  policy_arns                      = ["arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"]
  ignore_policy_attachment_changes = false
  create_instance_profile          = true
}
