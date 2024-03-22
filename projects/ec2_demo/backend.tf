terraform {
  backend "s3" {
    region         = "us-west-2"
    encrypt        = true

    # Hub Stack Output: TerraformStateS3Bucket
    bucket         = "Placeholder_TerraformStateS3Bucket"

    # Hub Stack Output: DynamoDBTableName
    dynamodb_table = "Placeholder_DynamoDBTableName"
    assume_role = {

        # Hub Stack Output: TerraformHubRoleArn
        role_arn = "Placeholder_TerraformHubRoleArn"
    }
  }
}