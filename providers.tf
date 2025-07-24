provider "aws" {
  region = var.aws_region

  default_tags {
    tags = merge({
      Terraform   = "true"
      Description = "ACM Approaching Expiry Notifications"
    }, var.default_tags)
  }
}
