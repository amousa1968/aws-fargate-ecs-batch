resource "null_resource" "batch_resource_policy" {
  triggers = {
    name   = var.policy_name
    policy = var.policy_document
  }
}
