data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "aws_elb_service_account" "main" {}

resource "random_string" "random" {
  length           = 8
  lower            = true
  upper            = false
  special          = false
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.use_string_randomizer ? "${var.bucket_name}-${random_string.random.result}" : var.bucket_name
  force_destroy = var.force_destroy
}

resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.ownership]

  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}

# https://docs.aws.amazon.com/elasticloadbalancing/latest/application/enable-access-logging.html
resource "aws_s3_bucket_policy" "alb_log_bucket_policy" {
  count  = var.lb_type == "alb" ? 1 : 0
  bucket = aws_s3_bucket.bucket.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          "AWS": "${data.aws_elb_service_account.main.arn}"
        },
        Action   = "s3:PutObject",
        Resource = var.prefix != null ? "arn:aws:s3:::${aws_s3_bucket.bucket.id}/${var.prefix}/AWSLogs/${data.aws_caller_identity.current.account_id}/*" : "arn:aws:s3:::${aws_s3_bucket.bucket.id}/AWSLogs/${data.aws_caller_identity.current.account_id}/*"
      }
    ]
  })
}

# https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-access-logs.html#access-logging-bucket-requirements
resource "aws_s3_bucket_policy" "nlb_log_bucket_policy" {
  count  = var.lb_type == "nlb" ? 1 : 0
  bucket = aws_s3_bucket.bucket.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AWSLogDeliveryAclCheck",
        Effect    = "Allow",
        Principal = {
          Service = "delivery.logs.amazonaws.com"
        },
        Action   = "s3:GetBucketAcl",
        Resource = "arn:aws:s3:::${aws_s3_bucket.bucket.id}",
        Condition = {
          StringEquals = {
            "aws:SourceAccount" = "${data.aws_caller_identity.current.account_id}"
          },
          ArnLike = {
            "aws:SourceArn" = "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:*"
          }
        }
      },
      {
        Sid       = "AWSLogDeliveryWrite"
        Effect    = "Allow",
        Principal = {
          Service = "delivery.logs.amazonaws.com"
        },
        Action   = "s3:PutObject",
        Resource = var.prefix != null ? "arn:aws:s3:::${aws_s3_bucket.bucket.id}/${var.prefix}/AWSLogs/${data.aws_caller_identity.current.account_id}/*" : "arn:aws:s3:::${aws_s3_bucket.bucket.id}/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
        Condition = {
          StringEquals = {
            "aws:SourceAccount" = "${data.aws_caller_identity.current.account_id}",
            "s3:x-amz-acl" = "bucket-owner-full-control"
          },
          ArnLike = {
              "aws:SourceArn" = "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:*"
          }
        }
      }
    ]
  })
}

