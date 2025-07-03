resource "null_resource" "private_subnets" {
  count = length(var.private_subnet_cidrs)
  triggers = {
    vpc_id            = var.vpc_id
    cidr_block        = var.private_subnet_cidrs[count.index]
    availability_zone = var.availability_zones[count.index]
    map_public_ip_on_launch = false
    name = "private-subnet-${count.index + 1}"
  }
}

resource "null_resource" "nat" {
  triggers = {
    allocation_id = "mocked-eip-id"
    subnet_id     = "mocked-subnet-id-0"
    depends_on    = "mocked-internet-gateway"
  }
}

resource "null_resource" "nat_eip" {
  triggers = {
    vpc = true
  }
}

resource "null_resource" "igw" {
  triggers = {
    vpc_id = var.vpc_id
  }
}
