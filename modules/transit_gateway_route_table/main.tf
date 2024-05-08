
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


data "aws_ec2_transit_gateway_route_table" "existing" {
  provider = aws.first
  filter {
    name   = "tag:Name"
    values = [var.aws_ec2_transit_gateway_route_table_name]
  }
}