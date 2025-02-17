resource "aws_vpc" "this" {
  cidr_block = var.cidr_block

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnets" {
  count                   = 2
  vpc_id                  = aws_vpc.this.id
  cidr_block              = element(split(".", var.cidr_block), 0) + "." + element(split(".", var.cidr_block), 1) + "." + count.index + ".0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = var.vpc_name + "-subnet-${count.index + 1}"
  }
}

output "vpc_id" {
  value = aws_vpc.this.id
}

output "subnet_ids" {
  value = aws_subnet.subnets[*].id
}
