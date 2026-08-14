// Added the existing backend file for tf state
terraform {
  backend "s3" {
    bucket  = "terraform-backend-010265787962-ap-south-1-an"
    region  = "ap-south-1"
    key     = "dev/terraform.tfstate"
    acl     = "private"
    encrypt = true
  }
}

// Creating bucket for my application tiers and vpc tier
resource "aws_s3_bucket" "app_tier" {
  bucket           = local.s3_app_tier_bucket_credentials.name
  bucket_namespace = "account-regional"

  // global custom tags
  tags = local.global_tags

}

# resource "aws_s3_bucket_acl" "s3_public_acl" {
#   bucket = aws_s3_bucket.app_tier.id
#   acl    = "public-read"
# }

resource "aws_s3_bucket_versioning" "s3_version_config" {
  bucket = aws_s3_bucket.app_tier.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_accelerate_configuration" "app-tier_s3_accelerate" {
  bucket = aws_s3_bucket.app_tier.id
  status = "Suspended"
}

resource "aws_s3_bucket_ownership_controls" "app_tier_s3_ownership" {
  bucket = aws_s3_bucket.app_tier.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
# resource "aws_s3_bucket" "vpc_workflow" {

# }
