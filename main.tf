terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "step1_ebs_s3_tls" {
  source = "./modules/step1_ebs_s3_tls"
  aws_region           = var.aws_region
  log_group_name       = var.log_group_name
  max_vcpus            = var.max_vcpus
  subnets              = var.subnets
  security_group_ids   = var.security_group_ids
  container_image      = var.container_image
  batch_service_role_arn = var.batch_service_role_arn
}

module "step2_networking" {
  source               = "./modules/step2_networking"
  vpc_cidr             = var.vpc_cidr
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  allowed_ingress_cidrs = var.allowed_ingress_cidrs
}

module "step3_cloudtrail_image_scanning" {
  source = "./modules/step3_cloudtrail_image_scanning"
  cloudtrail_s3_bucket = var.s3_bucket_name
  cloudtrail_name = var.cloudtrail_name
  s3_bucket_name = var.s3_bucket_name
}

module "step4_inspector_guardduty" {
  source = "./modules/step4_inspector_guardduty"
  aws_region = var.aws_region
  ecs_cluster_arn = var.ecs_cluster_arn
}

module "step5_iam_roles" {
  source = "./modules/step5_iam_roles"
  iam_role_name = var.iam_role_name
  iam_policy_arns = var.iam_policy_arns
}

module "step6_resource_policies" {
  source = "./modules/step6_resource_policies"
  policy_name = var.policy_name
  policy_document = var.policy_document
}

module "step7_tls_encryption" {
  source = "./modules/step7_tls_encryption"
  load_balancer_arn = var.load_balancer_arn
  target_group_arn = var.target_group_arn
  certificate_arn = var.certificate_arn
}

module "step8_cloudtrail_eventbridge" {
  source = "./modules/step8_cloudtrail_eventbridge"
  cloudtrail_name = var.cloudtrail_name
  s3_bucket_name = var.s3_bucket_name
  event_bus_name = var.event_bus_name
  event_target_arn = var.event_target_arn
}

module "step9_cloudwatch_alarms" {
  source = "./modules/step9_cloudwatch_alarms"
  alarm_name = var.alarm_name
  metric_name = var.metric_name
  namespace = var.namespace
  threshold = var.threshold
  comparison_operator = var.comparison_operator
  evaluation_periods = var.evaluation_periods
  alarm_actions = var.alarm_actions
}

module "step10_private_subnets_nat" {
  source = "./modules/step10_private_subnets_nat"
  vpc_id = var.vpc_id
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones = var.availability_zones
}

module "step11_iam_roles_minimal" {
  source = "./modules/step11_iam_roles_minimal"
  job_type = var.job_type
  iam_policy_document = var.iam_policy_document
}

module "step12_job_queue_compute_env" {
  source = "./modules/step12_job_queue_compute_env"
  job_queue_name = var.job_queue_name
  priority = var.priority
  compute_environment_order = var.compute_environment_order
  state = var.state
}

module "step13_security_hub" {
  source = "./modules/step13_security_hub"
  security_standards = var.security_standards
}
