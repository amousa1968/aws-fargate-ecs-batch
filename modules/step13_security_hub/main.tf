resource "null_resource" "securityhub_account" {
  triggers = {
    always_run = timestamp()
  }
}

resource "null_resource" "securityhub_standards_subscription" {
  for_each = toset(var.security_standards)
  triggers = {
    standards_arn = each.value
  }
}
