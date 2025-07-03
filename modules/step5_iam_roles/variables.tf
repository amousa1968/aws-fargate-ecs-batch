variable "iam_role_name" {
  description = "Name of the IAM role for Batch jobs"
  type        = string
}

variable "iam_policy_arns" {
  description = "List of IAM policy ARNs to attach to the role"
  type        = list(string)
}
