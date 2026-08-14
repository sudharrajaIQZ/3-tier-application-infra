data "aws_caller_identity" "current_caller" {}
data "aws_region" "current_region" {}

locals {

  // for s3 bucket credentials
  s3_app_tier_bucket_credentials = {
    alias = "app_tier_s3_bucket"
    name  = format("app-tier-%s-%s-%s-an", var.environment, data.aws_caller_identity.current_caller.account_id, data.aws_region.current_region.region)
    key   = "app"
  }

  s3_vpc_tier_bucket_credentials = {
    alias = "vpc_tier_workflow_s3_bucket_tfstate"
    name  = format("vpc-workflow-tier-%s-%s-%s-an", var.environment, data.aws_caller_identity.current_caller.account_id, data.aws_region.current_region.region)
    key   = ""
  }

  // for tags
  global_tags = {
    Name        = var.environment
    name        = "gloabl_name_${var.environment}"
    environment = var.environment
  }
}
