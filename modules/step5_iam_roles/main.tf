resource "null_resource" "batch_job_role" {
  triggers = {
    name = var.iam_role_name
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

resource "null_resource" "batch_job_role_attach" {
  count = length(var.iam_policy_arns)
  triggers = {
    role = var.iam_role_name
    policy_arn = join(",", var.iam_policy_arns)
  }
}
