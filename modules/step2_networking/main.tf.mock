resource "aws_vpc" "batch_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "private_subnet" {
  count = length(var.private_subnet_cidrs)
  vpc_id                  = aws_vpc.batch_vpc.id
  cidr_block              = var.private_subnet_cidrs[count.index]
  map_public_ip_on_launch = false
  availability_zone       = element(var.availability_zones, count.index)
}

resource "aws_network_acl" "private_nacl" {
  vpc_id = aws_vpc.batch_vpc.id
  subnet_ids = [for i in range(length(var.private_subnet_cidrs)) : aws_subnet.private_subnet[i].id]
  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.vpc_cidr
  }
  egress {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
  }
}

resource "aws_security_group" "batch_sg" {
  name        = "batch-security-group"
  description = "Security group for AWS Batch compute environment"
  vpc_id      = aws_vpc.batch_vpc.id
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.allowed_ingress_cidrs
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
