variable "alarm_name" {
  description = "Name of the CloudWatch alarm"
  type        = string
}

variable "metric_name" {
  description = "Name of the CloudWatch metric"
  type        = string
}

variable "namespace" {
  description = "Namespace of the CloudWatch metric"
  type        = string
}

variable "threshold" {
  description = "Threshold for the alarm"
  type        = number
}

variable "comparison_operator" {
  description = "Comparison operator for the alarm"
  type        = string
}

variable "evaluation_periods" {
  description = "Number of periods for evaluation"
  type        = number
}

variable "alarm_actions" {
  description = "List of ARNs to notify when alarm triggers"
  type        = list(string)
}
