variable "batch_service_role_arn" {
  description = "ARN of the AWS Batch service role"
  type        = string
}

variable "container_image" {
  description = "Container image for the batch job"
  type        = string
}

variable "log_group_name" {
  description = "CloudWatch log group name"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs for the compute environment"
  type        = list(string)
}

variable "max_vcpus" {
  description = "Maximum vCPUs for the compute environment"
  type        = number
}

variable "security_group_ids" {
  description = "List of security group IDs for the compute environment"
  type        = list(string)
}
