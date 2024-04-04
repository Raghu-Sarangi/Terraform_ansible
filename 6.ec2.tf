# resource "aws_instance" "web-1" {
#   count                       = var.env == "dev" || var.env == "uat" || var.env == "prod" ? 3 : 1
#   ami                         = var.imagename
#   instance_type               = var.instancetype
#   key_name                    = var.keyname
#   subnet_id                   = element(aws_subnet.private-subnets.*.id, count.index)
#   vpc_security_group_ids      = ["${aws_security_group.allow_all_sg.id}"]
#   associate_public_ip_address = true
#   tags = {
#     Name  = "${var.vpc_name}-${var.env}-Server-0${count.index + 1}"
#     Env   = var.env
#     Owner = var.owner
#   }
#   user_data = <<-EOF
# 		#!/bin/bash
#     sudo apt-get update
# 		sudo apt-get install -y apache2
# 		sudo systemctl start apache2
# 		sudo systemctl enable apache2
# 		echo "<center><h1>${var.vpc_name}-${var.env}-Server-0${count.index + 1}</h1></center>" | sudo tee /var/www/html/index.html
# 	EOF
# }

resource "aws_instance" "web-1" {
  count                       = var.env == "dev" || var.env == "uat" || var.env == "prod" ? 3 : 1
  ami                         = var.imagename
  instance_type               = var.instancetype
  key_name                    = var.keyname
  subnet_id                   = element(aws_subnet.public-subnets.*.id, count.index)
  vpc_security_group_ids      = ["${aws_security_group.allow_all_sg.id}"]
  associate_public_ip_address = true
  tags = {
    Name  = "${var.vpc_name}-${var.env}-Server-0${count.index + 1}"
    Env   = var.env
    Owner = var.owner
  }
  user_data = <<-EOF
		#!/bin/bash
    sudo apt-get update
		sudo apt-get install -y apache2
		sudo systemctl start apache2
		sudo systemctl enable apache2
		echo "<center><h1>${var.vpc_name}-${var.env}-Server-0${count.index + 1}</h1></center>" | sudo tee /var/www/html/index.html
	EOF
}
