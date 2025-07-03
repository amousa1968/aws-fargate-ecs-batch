resource "null_resource" "cloudtrail_bucket" {
  triggers = {
    bucket = var.s3_bucket_name
    acl    = "private"
  }
}

resource "null_resource" "batch_cloudtrail" {
  triggers = {
    name                          = var.cloudtrail_name
    s3_bucket_name                = var.s3_bucket_name
    include_global_service_events = true
    is_multi_region_trail         = true
    enable_log_file_validation    = true
    read_write_type               = "All"
    include_management_events     = true
    data_resource_type            = "AWS::S3::Object"
    data_resource_values          = join(",", ["arn:aws:s3:::${var.s3_bucket_name}/"])
  }
}

resource "null_resource" "batch_ecr_repo" {
  triggers = {
    name = "batch-ecr-repo"
    scan_on_push = true
    encryption_type = "AES256"
  }
}
