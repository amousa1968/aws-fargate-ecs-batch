resource "null_resource" "batch_alarm" {
  triggers = {
    alarm_name          = var.alarm_name
    comparison_operator = var.comparison_operator
    evaluation_periods  = var.evaluation_periods
    metric_name         = var.metric_name
    namespace           = var.namespace
    period              = 60
    statistic           = "Average"
    threshold           = var.threshold
    alarm_actions       = join(",", var.alarm_actions)
  }
}
