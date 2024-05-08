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

data "aws_ec2_transit_gateway" "existing" {
  provider = aws.first

  filter {
    name   = "tag:Name"
    values = [var.transit_gateway_name]
  }

  filter {
    name   = "transit-gateway-id"
    values = [var.transit_gateway_id]
  }
}