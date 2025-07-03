resource "null_resource" "guardduty_detector" {
  triggers = {
    enable = true
  }
}

resource "null_resource" "inspector_resource_group" {
  triggers = {
    ecs_cluster_arn = var.ecs_cluster_arn
  }
}

resource "null_resource" "inspector_assessment_target" {
  triggers = {
    name       = "ecs-assessment-target"
    resource_group_arn = "mocked-resource-group-arn"
  }
}

resource "null_resource" "inspector_assessment_template" {
  triggers = {
    name                   = "ecs-assessment-template"
    target_arn             = "mocked-assessment-target-arn"
    duration               = 3600
    rules_package_arns     = join(",", [
      "arn:aws:inspector:us-east-1:758058086616:rulespackage/0-ub9O3zjz"
    ])
  }
}
