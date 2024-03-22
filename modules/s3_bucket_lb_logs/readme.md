# **AWS S3 Bucket Terraform Module**

## **Summary**
This module provisions an AWS S3 bucket with optional versioning, ownership controls, and access control list (ACL) settings. The bucket name can be customized, and a random string can be appended to ensure uniqueness.

## **Variables**
- `name` (`string`): Custom name for the S3 bucket. Default is an empty string.
- `env` (`string`): Environment (e.g., "prod", "dev"). Default is an empty string.
- `workload` (`string`): Workload identifier. Default is an empty string.
- `context` (`string`): Context for the bucket, typically indicating its use. Default is "deployment".
- `use_string_randomizer` (`bool`): Whether to append a random string to the bucket name for uniqueness. Default is `false`.
- `versioning_status` (`string`): Versioning status for the S3 bucket. Must be either "Enabled" or "Disabled". Default is "Disabled".

## **Outputs**
- `arn`: ARN of the created S3 bucket.
- `name`: Name of the created S3 bucket.

## **Example Usage**
```hcl
module "s3_bucket" {
  source = "[path_to_module]"

  name                = "my-custom-bucket"
  env                 = "prod"
  workload            = "data"
  context             = "backup"
  use_string_randomizer = true
  versioning_status   = "Enabled"
}
