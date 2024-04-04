# resource "aws_eip" "lb" {

#   tags = {
#     Name = "vpc-eip"
#   }
# }

# resource "aws_nat_gateway" "gw3" {

#   allocation_id = aws_eip.lb.id
#   subnet_id     = "subnet-0190aeac4683211e0"

#   tags = {
#     Name = "gw-NAT-2"
#   }
# }
