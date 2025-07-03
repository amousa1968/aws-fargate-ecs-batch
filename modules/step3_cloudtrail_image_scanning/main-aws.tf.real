resource "aws_cloudtrail" "batch_cloudtrail" {
  name                          = "batch-cloudtrail"
  s3_bucket_name                = var.cloudtrail_s3_bucket
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true
  event_selector {
    read_write_type           = "All"
    include_management_events = true
    data_resource {
      type   = "AWS::S3::Object"
      values = ["arn:aws:s3:::"]
    }
  }
}

resource "aws_ecr_repository" "batch_ecr_repo" {
  name = "batch-ecr-repo"
  image_scanning_configuration {
    scan_on_push = true
  }
}
