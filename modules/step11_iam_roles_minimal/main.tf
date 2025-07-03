resource "null_resource" "batch_job_minimal_role" {
  triggers = {
    name = "batch-job-${var.job_type}-role"
    assume_role_policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Effect = "Allow"
          Principal = {
            Service = "ecs-tasks.amazonaws.com"
          }
          Action = "sts:AssumeRole"
        }
      ]
    })
  }
}

resource "null_resource" "batch_job_minimal_policy" {
  triggers = {
    name   = "batch-job-${var.job_type}-policy"
    policy = var.iam_policy_document
  }
}

resource "null_resource" "batch_job_minimal_attach" {
  triggers = {
    role       = "batch-job-${var.job_type}-role"
    policy_arn = "mocked-policy-arn"
  }
}
