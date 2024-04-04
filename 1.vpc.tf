resource "aws_vpc" "vpc1" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name  = var.vpc_name
    Owner = var.owner
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    Name = "${var.vpc_name}-IGW"

  }
}