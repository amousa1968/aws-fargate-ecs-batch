
This completes the requested task of creating the AWS Batch with Fargate ECS Terraform project with modular steps and mock testing support.

$ terraform -chdir=terraform/aws-fargate-ecs-batch plan -refresh=false

Terraform used the selected providers to generate the following execution plan.    
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # null_resource.mock_batch_job_queue[0] will be created
  + resource "null_resource" "mock_batch_job_queue" {
      + id       = (known after apply)
      + triggers = {
          + "always_run" = (known after apply)
        }
    }

  # module.step10_private_subnets_nat.null_resource.igw will be created
  + resource "null_resource" "igw" {
      + id       = (known after apply)
      + triggers = {
          + "vpc_id" = "vpc-0123456789abcdef0"
        }
    }

  # module.step10_private_subnets_nat.null_resource.nat will be created
  + resource "null_resource" "nat" {
      + id       = (known after apply)
      + triggers = {
          + "allocation_id" = "mocked-eip-id"
          + "depends_on"    = "mocked-internet-gateway"
          + "subnet_id"     = "mocked-subnet-id-0"
        }
    }

  # module.step10_private_subnets_nat.null_resource.nat_eip will be created        
  + resource "null_resource" "nat_eip" {
      + id       = (known after apply)
      + triggers = {
          + "vpc" = "true"
        }
    }

  # module.step10_private_subnets_nat.null_resource.private_subnets[0] will be created
  + resource "null_resource" "private_subnets" {
      + id       = (known after apply)
      + triggers = {
          + "availability_zone"       = "us-east-1a"
          + "cidr_block"              = "10.0.1.0/24"
          + "map_public_ip_on_launch" = "false"
          + "name"                    = "private-subnet-1"
          + "vpc_id"                  = "vpc-0123456789abcdef0"
        }
    }

  # module.step10_private_subnets_nat.null_resource.private_subnets[1] will be created
  + resource "null_resource" "private_subnets" {
      + id       = (known after apply)
      + triggers = {
          + "availability_zone"       = "us-east-1b"
          + "cidr_block"              = "10.0.2.0/24"
          + "map_public_ip_on_launch" = "false"
          + "name"                    = "private-subnet-2"
          + "vpc_id"                  = "vpc-0123456789abcdef0"
        }
    }

  # module.step11_iam_roles_minimal.null_resource.batch_job_minimal_attach will be created
  + resource "null_resource" "batch_job_minimal_attach" {
      + id       = (known after apply)
      + triggers = {
          + "policy_arn" = "mocked-policy-arn"
          + "role"       = "batch-job-example-job-role"
        }
    }

  # module.step11_iam_roles_minimal.null_resource.batch_job_minimal_policy will be created
  + resource "null_resource" "batch_job_minimal_policy" {
      + id       = (known after apply)
      + triggers = {
          + "name"   = "batch-job-example-job-policy"
          + "policy" = jsonencode(
                {
                  + Statement = []
                  + Version   = "2012-10-17"
                }
            )
        }
    }

  # module.step11_iam_roles_minimal.null_resource.batch_job_minimal_role will be created
  + resource "null_resource" "batch_job_minimal_role" {
      + id       = (known after apply)
      + triggers = {
          + "assume_role_policy" = jsonencode(
                {
                  + Statement = [
                      + {
                          + Action    = "sts:AssumeRole"
                          + Effect    = "Allow"
                          + Principal = {
                              + Service = "ecs-tasks.amazonaws.com"
                            }
                        },
                    ]
                  + Version   = "2012-10-17"
                }
            )
          + "name"               = "batch-job-example-job-role"
        }
    }

  # module.step12_job_queue_compute_env.null_resource.batch_job_queue will be created
  + resource "null_resource" "batch_job_queue" {
      + id       = (known after apply)
      + triggers = {
          + "compute_environment_arns" = "arn:aws:batch:us-east-1:123456789012:compute-environment/my-compute-environment"
          + "name"                     = "batch-job-queue"
          + "priority"                 = "1"
          + "state"                    = "ENABLED"
        }
    }

  # module.step13_security_hub.null_resource.securityhub_account will be created   
  + resource "null_resource" "securityhub_account" {
      + id       = (known after apply)
      + triggers = {
          + "always_run" = (known after apply)
        }
    }

  # module.step13_security_hub.null_resource.securityhub_standards_subscription["arn:aws:securityhub:::ruleset/aws-foundational-security-best-practices/v/1.0.0"] will be created
  + resource "null_resource" "securityhub_standards_subscription" {
      + id       = (known after apply)
      + triggers = {
          + "standards_arn" = "arn:aws:securityhub:::ruleset/aws-foundational-security-best-practices/v/1.0.0"
        }
    }

  # module.step1_ebs_s3_tls.null_resource.batch_data_bucket will be created        
  + resource "null_resource" "batch_data_bucket" {
      + id       = (known after apply)
      + triggers = {
          + "bucket_name" = (known after apply)
        }
    }

  # module.step1_ebs_s3_tls.null_resource.ebs_encryption_by_default will be created
  + resource "null_resource" "ebs_encryption_by_default" {
      + id       = (known after apply)
      + triggers = {
          + "always_run" = (known after apply)
        }
    }

  # module.step1_ebs_s3_tls.null_resource.example_job_definition will be created   
  + resource "null_resource" "example_job_definition" {
      + id       = (known after apply)
      + triggers = {
          + "aws_region"            = "us-east-1"
          + "container_image"       = "123456789012.dkr.ecr.us-east-1.amazonaws.com/my-batch-job:latest"
          + "log_group_name"        = "/aws/batch/job"
          + "memory"                = "2048"
          + "name"                  = "example-job-definition"
          + "platform_capabilities" = "FARGATE"
          + "type"                  = "container"
          + "vcpus"                 = "1"
        }
    }

  # module.step1_ebs_s3_tls.null_resource.fargate_compute_env will be created      
  + resource "null_resource" "fargate_compute_env" {
      + id       = (known after apply)
      + triggers = {
          + "compute_environment_name" = "fargate-compute-environment"
          + "service_role"             = "arn:aws:iam::123456789012:role/AWSBatchServiceRole"
          + "type"                     = "MANAGED"
        }
    }

  # module.step1_ebs_s3_tls.random_id.bucket_id will be created
  + resource "random_id" "bucket_id" {
      + b64_std     = (known after apply)
      + b64_url     = (known after apply)
      + byte_length = 4
      + dec         = (known after apply)
      + hex         = (known after apply)
      + id          = (known after apply)
    }

  # module.step2_networking.null_resource.batch_sg will be created
  + resource "null_resource" "batch_sg" {
      + id       = (known after apply)
      + triggers = {
          + "description"         = "Security group for AWS Batch compute environment"
          + "egress_cidr_blocks"  = "0.0.0.0/0"
          + "egress_from_port"    = "0"
          + "egress_protocol"     = "-1"
          + "egress_to_port"      = "0"
          + "ingress_cidr_blocks" = "10.0.0.0/16"
          + "ingress_from_port"   = "443"
          + "ingress_protocol"    = "tcp"
          + "ingress_to_port"     = "443"
          + "name"                = "batch-security-group"
          + "vpc_id"              = "mocked-vpc-id"
        }
    }

  # module.step2_networking.null_resource.batch_vpc will be created
  + resource "null_resource" "batch_vpc" {
      + id       = (known after apply)
      + triggers = {
          + "cidr_block"           = "10.0.0.0/16"
          + "enable_dns_hostnames" = "true"
          + "enable_dns_support"   = "true"
        }
    }

  # module.step2_networking.null_resource.private_nacl will be created
  + resource "null_resource" "private_nacl" {
      + id       = (known after apply)
      + triggers = {
          + "egress_action"      = "allow"
          + "egress_cidr_block"  = "0.0.0.0/0"
          + "egress_protocol"    = "-1"
          + "egress_rule_no"     = "100"
          + "ingress_action"     = "allow"
          + "ingress_cidr_block" = "10.0.0.0/16"
          + "ingress_protocol"   = "-1"
          + "ingress_rule_no"    = "100"
          + "subnet_ids"         = "mocked-subnet-id-0,mocked-subnet-id-1"
          + "vpc_id"             = "mocked-vpc-id"
        }
    }

  # module.step2_networking.null_resource.private_subnet[0] will be created        
  + resource "null_resource" "private_subnet" {
      + id       = (known after apply)
      + triggers = {
          + "availability_zone"       = "us-east-1a"
          + "cidr_block"              = "10.0.1.0/24"
          + "map_public_ip_on_launch" = "false"
          + "vpc_id"                  = "mocked-vpc-id"
        }
    }

  # module.step2_networking.null_resource.private_subnet[1] will be created        
  + resource "null_resource" "private_subnet" {
      + id       = (known after apply)
      + triggers = {
          + "availability_zone"       = "us-east-1b"
          + "cidr_block"              = "10.0.2.0/24"
          + "map_public_ip_on_launch" = "false"
          + "vpc_id"                  = "mocked-vpc-id"
        }
    }

  # module.step3_cloudtrail_image_scanning.null_resource.batch_cloudtrail will be created
  + resource "null_resource" "batch_cloudtrail" {
      + id       = (known after apply)
      + triggers = {
          + "data_resource_type"            = "AWS::S3::Object"
          + "data_resource_values"          = "arn:aws:s3:::my-batch-cloudtrail-logs/"
          + "enable_log_file_validation"    = "true"
          + "include_global_service_events" = "true"
          + "include_management_events"     = "true"
          + "is_multi_region_trail"         = "true"
          + "name"                          = "batch-cloudtrail"
          + "read_write_type"               = "All"
          + "s3_bucket_name"                = "my-batch-cloudtrail-logs"
        }
    }

  # module.step3_cloudtrail_image_scanning.null_resource.batch_ecr_repo will be created
  + resource "null_resource" "batch_ecr_repo" {
      + id       = (known after apply)
      + triggers = {
          + "encryption_type" = "AES256"
          + "name"            = "batch-ecr-repo"
          + "scan_on_push"    = "true"
        }
    }

  # module.step3_cloudtrail_image_scanning.null_resource.cloudtrail_bucket will be created
  + resource "null_resource" "cloudtrail_bucket" {
      + id       = (known after apply)
      + triggers = {
          + "acl"    = "private"
          + "bucket" = "my-batch-cloudtrail-logs"
        }
    }

  # module.step4_inspector_guardduty.null_resource.guardduty_detector will be created
  + resource "null_resource" "guardduty_detector" {
      + id       = (known after apply)
      + triggers = {
          + "enable" = "true"
        }
    }

  # module.step4_inspector_guardduty.null_resource.inspector_assessment_target will be created
  + resource "null_resource" "inspector_assessment_target" {
      + id       = (known after apply)
      + triggers = {
          + "name"               = "ecs-assessment-target"
          + "resource_group_arn" = "mocked-resource-group-arn"
        }
    }

  # module.step4_inspector_guardduty.null_resource.inspector_assessment_template will be created
  + resource "null_resource" "inspector_assessment_template" {
      + id       = (known after apply)
      + triggers = {
          + "duration"           = "3600"
          + "name"               = "ecs-assessment-template"
          + "rules_package_arns" = "arn:aws:inspector:us-east-1:758058086616:rulespackage/0-ub9O3zjz"
          + "target_arn"         = "mocked-assessment-target-arn"
        }
    }

  # module.step4_inspector_guardduty.null_resource.inspector_resource_group will be created
  + resource "null_resource" "inspector_resource_group" {
      + id       = (known after apply)
      + triggers = {
          + "ecs_cluster_arn" = "arn:aws:ecs:us-east-1:123456789012:cluster/my-ecs-cluster"
        }
    }

  # module.step5_iam_roles.null_resource.batch_job_role will be created
  + resource "null_resource" "batch_job_role" {
      + id       = (known after apply)
      + triggers = {
          + "assume_role_policy" = jsonencode(
                {
                  + Statement = [
                      + {
                          + Action    = "sts:AssumeRole"
                          + Effect    = "Allow"
                          + Principal = {
                              + Service = "ecs-tasks.amazonaws.com"
                            }
                        },
                    ]
                  + Version   = "2012-10-17"
                }
            )
          + "name"               = "batch-job-role"
        }
    }

  # module.step5_iam_roles.null_resource.batch_job_role_attach[0] will be created  
  + resource "null_resource" "batch_job_role_attach" {
      + id       = (known after apply)
      + triggers = {
          + "policy_arn" = "arn:aws:iam::aws:policy/service-role/AWSBatchServiceRole"
          + "role"       = "batch-job-role"
        }
    }

  # module.step6_resource_policies.null_resource.batch_resource_policy will be created
  + resource "null_resource" "batch_resource_policy" {
      + id       = (known after apply)
      + triggers = {
          + "name"   = "batch-resource-policy"
          + "policy" = jsonencode(
                {
                  + Statement = []
                  + Version   = "2012-10-17"
                }
            )
        }
    }

  # module.step7_tls_encryption.null_resource.https_listener will be created       
  + resource "null_resource" "https_listener" {
      + id       = (known after apply)
      + triggers = {
          + "certificate_arn"   = "arn:aws:acm:us-east-1:123456789012:certificate/abcdefg-1234-5678-abcd-1234567890ab"
          + "load_balancer_arn" = "arn:aws:elasticloadbalancing:us-east-1:123456789012:loadbalancer/app/my-load-balancer/50dc6c495c0c9188"
          + "port"              = "443"
          + "protocol"          = "HTTPS"
          + "ssl_policy"        = "ELBSecurityPolicy-2016-08"
          + "target_group_arn"  = "arn:aws:elasticloadbalancing:us-east-1:123456789012:targetgroup/my-targets/73e2d6bc24d8a067"
        }
    }

  # module.step8_cloudtrail_eventbridge.null_resource.batch_api_calls will be created
  + resource "null_resource" "batch_api_calls" {
      + id       = (known after apply)
      + triggers = {
          + "description"    = "Rule to capture AWS Batch API calls"
          + "event_bus_name" = "default"
          + "event_pattern"  = jsonencode(
                {
                  + source = [
                      + "aws.batch",
                    ]
                }
            )
          + "name"           = "batch-api-calls"
        }
    }

  # module.step8_cloudtrail_eventbridge.null_resource.batch_cloudtrail will be created
  + resource "null_resource" "batch_cloudtrail" {
      + id       = (known after apply)
      + triggers = {
          + "data_resource_type"            = "AWS::S3::Object"
          + "data_resource_values"          = "arn:aws:s3:::my-batch-cloudtrail-logs/"
          + "enable_log_file_validation"    = "true"
          + "include_global_service_events" = "true"
          + "include_management_events"     = "true"
          + "is_multi_region_trail"         = "true"
          + "name"                          = "batch-cloudtrail"
          + "read_write_type"               = "All"
          + "s3_bucket_name"                = "my-batch-cloudtrail-logs"
        }
    }

  # module.step8_cloudtrail_eventbridge.null_resource.batch_event_bus will be created
  + resource "null_resource" "batch_event_bus" {
      + id       = (known after apply)
      + triggers = {
          + "name" = "default"
        }
    }

  # module.step8_cloudtrail_eventbridge.null_resource.batch_event_target will be created
  + resource "null_resource" "batch_event_target" {
      + id       = (known after apply)
      + triggers = {
          + "arn"       = "arn:aws:lambda:us-east-1:123456789012:function:ProcessBatchEvents"
          + "rule"      = "batch-api-calls"
          + "target_id" = "batch-event-target"
        }
    }

  # module.step8_cloudtrail_eventbridge.null_resource.cloudtrail_bucket will be created
  + resource "null_resource" "cloudtrail_bucket" {
      + id       = (known after apply)
      + triggers = {
          + "acl"    = "private"
          + "bucket" = "my-batch-cloudtrail-logs"
        }
    }

  # module.step9_cloudwatch_alarms.null_resource.batch_alarm will be created       
  + resource "null_resource" "batch_alarm" {
      + id       = (known after apply)
      + triggers = {
          + "alarm_actions"       = "arn:aws:sns:us-east-1:123456789012:NotifyMe"  
          + "alarm_name"          = "BatchJobFailureAlarm"
          + "comparison_operator" = "GreaterThanOrEqualToThreshold"
          + "evaluation_periods"  = "1"
          + "metric_name"         = "FailedJobs"
          + "namespace"           = "AWS/Batch"
          + "period"              = "60"
          + "statistic"           = "Average"
          + "threshold"           = "1"
        }
    }

Plan: 39 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + region = "us-east-1"

────────────────────────────────────────────────────────────────────────────────── 

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.
$
