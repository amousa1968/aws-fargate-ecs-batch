variable "job_queue_name" {
  description = "Name of the Batch job queue"
  type        = string
}

variable "priority" {
  description = "Priority of the job queue"
  type        = number
}

variable "compute_environment_order" {
  description = "List of compute environment ARNs with order"
  type = list(object({
    order                  = number
    compute_environment_arn = string
  }))
}

variable "state" {
  description = "State of the job queue"
  type        = string
  default     = "ENABLED"
}
