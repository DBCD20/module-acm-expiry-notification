variable "notification_email" {
  type        = string
  description = "Email address to receive notifications for ACM near expiry events"
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags to apply to all resources"
  default     = {}
}

variable "aws_region" {
  type        = string
  description = "AWS region to deploy resources in"
  default     = "us-east-1"
}

variable "sns_cmk_id" {
  type        = string
  description = "KMS Key ID for SNS topic encryption"
  default     = null
}