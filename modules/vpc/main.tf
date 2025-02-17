resource "aws_vpc" "this" {
  cidr_block = var.cidr_block

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnets" {
  count                   = 2
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-subnet-${count.index + 1}"
  }
}

output "vpc_id" {
  value = aws_vpc.this.id
}

output "subnet_ids" {
  value = aws_subnet.subnets[*].id
}
