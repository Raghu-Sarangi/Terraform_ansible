locals {
  ingress_ports_sg = toset(var.ingress_ports)
  egress_ports_sg  = toset(var.egress_ports)
}


resource "aws_security_group" "allow_all_sg" {
  name        = "allow_all_sg"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.vpc1.id

  dynamic "ingress" {
    for_each = local.ingress_ports_sg
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = local.egress_ports_sg
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
