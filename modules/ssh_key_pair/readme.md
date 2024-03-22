# **AWS Key Pair and Secrets Manager Terraform Module**

## **Summary**
This module generates an RSA key pair, creates an AWS key pair using the public key, and stores the private key in AWS Secrets Manager. The module allows for customization of the key pair name and the recovery window for the secret in Secrets Manager.

## **Variables**
- `key_pair_name` (`string`): Name of the AWS key pair.
- `recovery_window_in_days` (`number`): Number of days that AWS Secrets Manager waits before it can delete the secret. This value can be 0 to force deletion without recovery or range from 7 to 30 days. Default is 30 days.
- `use_secret_name_randomizer` (`bool`): Whether to append a random string to the secret name in Secrets Manager for uniqueness. Default is `false`.

## **Outputs**
- `private_key`: The generated RSA private key. This output is sensitive.
- `public_key`: The generated RSA public key in OpenSSH format.
- `key_pair_name`: The name of the generated AWS key pair.
- `secretsmanager_secret_arn`: The ARN of the AWS Secrets Manager secret where the private key is stored.

## **Example Usage**
```hcl
module "key_pair_secrets" {
  source = "[path_to_module]"

  key_pair_name             = "my-key-pair"
  recovery_window_in_days   = 7
  use_secret_name_randomizer = true
}
