resource "null_resource" "batch_job_queue" {
  triggers = {
    name     = var.job_queue_name
    priority = var.priority
    state    = var.state
    compute_environment_arns = join(",", [for ce in var.compute_environment_order : ce.compute_environment_arn])
  }
}
