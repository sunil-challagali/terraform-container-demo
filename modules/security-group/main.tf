resource "aws_security_group" "this" {
  name        = var.sg_name
  description = "Security group for my app"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  tags = {
    Name = var.sg_name
  }
}

output "sg_id" {
  value = aws_security_group.this.id
}
