provider "aws" {
  region  = var.aws_region
  assume_role {
      role_arn = var.assume_role_arn
  }
  default_tags {
    tags = {
      "DataClassification"     = var.tag_DataClassification
      "Division"               = var.tag_Division
      "SupportContact"         = var.tag_SupportContact
      "Requestor"              = var.tag_Requestor
      "Unit"                   = var.tag_Unit
      "FundAuth"               = var.tag_FundAuth,
      "ManagedBy"              = var.tag_ManagedBy
    }
  }
}