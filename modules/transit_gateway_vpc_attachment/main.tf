provider "aws" {
  alias = "first"

  region  = "us-east-1"
  profile = "first_account"
}


provider "aws" {
  alias = "second"

  region  = "us-east-1"
  profile = "second_account"
}


resource "aws_ec2_transit_gateway_vpc_attachment" "mve" {
  #   depends_on         = [aws_vpc.vpc]
  count              = length(var.subnets)
  provider           = aws.second
  transit_gateway_id = var.transit_gateway_id
  vpc_id             = var.vpc_id
  subnet_ids         = var.subnet_ids
  tags = {
    Name = "mve"
  }
}