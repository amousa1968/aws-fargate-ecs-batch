variable "cloudtrail_s3_bucket" {
  description = "S3 bucket name for CloudTrail logs"
  type        = string
}

variable "s3_bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "cloudtrail_name" {
  description = "CloudTrail name"
  type        = string
}
