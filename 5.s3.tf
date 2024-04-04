resource "random_integer" "priority" {
  count = 3
  min   = 1111111
  max   = 9999999
}

resource "aws_s3_bucket" "bucks" {
  count  = 3
  bucket = "awsb57bucket${element(random_integer.priority.*.result, count.index)}"
  tags = {
    Name        = "awsb57bucket${element(random_integer.priority.*.result, count.index)}"
    Environment = var.env
  }
}

