resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_ebs_encryption_by_default" "default" {
  enabled = true
}

resource "aws_s3_bucket" "batch_data_bucket" {
  bucket = "batch-data-bucket-${random_id.bucket_id.hex}"
}

resource "aws_s3_bucket_acl" "batch_data_bucket_acl" {
  bucket = aws_s3_bucket.batch_data_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "batch_data_bucket_encryption" {
  bucket = aws_s3_bucket.batch_data_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_batch_compute_environment" "fargate_compute_env" {
  compute_environment_name = "fargate-compute-environment"
  service_role             = var.batch_service_role_arn
  type                     = "MANAGED"
  compute_resources {
    type        = "FARGATE"
    subnets     = var.subnets
    max_vcpus   = var.max_vcpus
    security_group_ids = var.security_group_ids
  }
  state = "ENABLED"
}

resource "aws_batch_job_definition" "example_job_definition" {
  name = "example-job-definition"
  type = "container"
  platform_capabilities = ["FARGATE"]

  container_properties = jsonencode({
    image        = var.container_image
    vcpus        = 1
    memory       = 2048
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        "awslogs-group"         = var.log_group_name
        "awslogs-region"        = var.aws_region
        "awslogs-stream-prefix" = "batch"
      }
    }
  })
}
