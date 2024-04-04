#Creating Public Routing Table
resource "aws_route_table" "terraform-public" {
  vpc_id = aws_vpc.vpc1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }
  tags = {
    Name = "${var.vpc_name}-Public-RT"
  }
}

#Creating Prvate Routing Table
resource "aws_route_table" "terraform-private" {

  vpc_id = aws_vpc.vpc1.id
  # route {
  #   cidr_block     = "0.0.0.0/0"
  #   nat_gateway_id = aws_nat_gateway.gw3.id
  # }

  tags = {
    Name = "${var.vpc_name}-Private-RT"
  }
}

#Creating Public Routing Table Association
resource "aws_route_table_association" "terraform-publicsubnets" {
  #count = 4
  count          = length(aws_subnet.public-subnets.*.id)
  subnet_id      = element(aws_subnet.public-subnets.*.id, count.index)
  route_table_id = aws_route_table.terraform-public.id
}

#Creating Priate Routing Table Association
resource "aws_route_table_association" "terraform-private-subnets" {
  #count = 4
  count          = length(aws_subnet.private-subnets.*.id)
  subnet_id      = element(aws_subnet.private-subnets.*.id, count.index)
  route_table_id = aws_route_table.terraform-private.id
}

