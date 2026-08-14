variable "vpc_name" {
  description = "vpc name for my 3 tier applicaiton"
  type        = string
  default     = "3_tier_applicaiton"
}

variable "aws_region" {
  description = "for a 3 tier applicaiton am using a mumbai region"
  type        = string
  default     = "ap-south-1"
}

variable "environment" {
  description = "Here we are using the dev environment"
  type        = string
  default     = "dev"
}

variable "aws_region_availability_zone" {
  description = "Here am listing all the availability zone for this region"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}

variable "s3_bucket_config" {
  description = "we are using the existing s3 bucket for store the tf state file with version enabled"
  type = object({
    alias  = string
    name   = string
    key    = string
  })
  default = {
    alias = ""
    key   = ""
    name  = ""
  }

}

variable "dev_tags" {
  description = "Global dev tags were created to use in all services"
  type = object({
    Name        = string
    name        = string
    environment = string
  })
  default = {
    Name        = ""
    name        = ""
    environment = ""
  }
}
