resource "aws_subnet" "public-subnets" {
  #count             = 4 # 0 1 2 3
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = element(var.public_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "${var.vpc_name}-public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private-subnets" {
  #count             = 4 # 0 1 2 3
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "${var.vpc_name}-private-subnet-${count.index + 1}"
  }
}