variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "max_vcpus" {
  description = "Maximum number of vCPUs for the Batch compute environment"
  type        = number
  default     = 16
}

variable "subnets" {
  description = "List of subnet IDs for the Batch compute environment"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs for the Batch compute environment"
  type        = list(string)
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "allowed_ingress_cidrs" {
  description = "List of CIDR blocks allowed for ingress"
  type        = list(string)
}

variable "log_group_name" {
  description = "CloudWatch log group name"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "batch_security_group_ids" {
  description = "List of security group IDs for Batch"
  type        = list(string)
}

variable "container_image" {
  description = "Container image URI for Batch jobs"
  type        = string
}

variable "batch_service_role_arn" {
  description = "ARN of the AWS Batch service role"
  type        = string
}

variable "cloudtrail_name" {
  description = "Name of the CloudTrail trail"
  type        = string
}

variable "s3_bucket_name" {
  description = "S3 bucket name for CloudTrail logs"
  type        = string
}

variable "ecs_cluster_arn" {
  description = "ARN of the ECS cluster"
  type        = string
}

variable "iam_role_name" {
  description = "Name of the IAM role for Batch jobs"
  type        = string
}

variable "iam_policy_arns" {
  description = "List of IAM policy ARNs to attach to the role"
  type        = list(string)
}

variable "policy_name" {
  description = "Name of the IAM policy"
  type        = string
}

variable "policy_document" {
  description = "IAM policy document JSON"
  type        = string
}

variable "load_balancer_arn" {
  description = "ARN of the load balancer"
  type        = string
}

variable "target_group_arn" {
  description = "ARN of the target group"
  type        = string
}

variable "event_bus_name" {
  description = "Name of the EventBridge event bus"
  type        = string
}

variable "event_target_arn" {
  description = "ARN of the EventBridge target"
  type        = string
}

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

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "job_type" {
  description = "Batch job type"
  type        = string
}

variable "iam_policy_document" {
  description = "IAM policy document JSON"
  type        = string
}

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
    order                   = number
    compute_environment_arn = string
  }))
}

variable "state" {
  description = "State of the job queue"
  type        = string
  default     = "ENABLED"
}

variable "security_standards" {
  description = "List of security standards to enable in Security Hub"
  type        = list(string)
}

variable "certificate_arn" {
  description = "ARN of the ACM certificate"
  type        = string
}
