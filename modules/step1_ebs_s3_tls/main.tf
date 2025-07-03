resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "null_resource" "ebs_encryption_by_default" {
  triggers = {
    always_run = timestamp()
  }
}

resource "null_resource" "batch_data_bucket" {
  triggers = {
    bucket_name = "batch-data-bucket-${random_id.bucket_id.hex}"
  }
}

resource "null_resource" "fargate_compute_env" {
  triggers = {
    compute_environment_name = "fargate-compute-environment"
    service_role             = var.batch_service_role_arn
    type                     = "MANAGED"
  }
}

resource "null_resource" "example_job_definition" {
  triggers = {
    name       = "example-job-definition"
    type       = "container"
    platform_capabilities = "FARGATE"
    container_image = var.container_image
    vcpus = 1
    memory = 2048
    log_group_name = var.log_group_name
    aws_region = var.aws_region
  }
}
