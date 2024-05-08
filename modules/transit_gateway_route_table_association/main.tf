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


resource "aws_ec2_transit_gateway_route_table_association" "new_assoc" {

  provider = aws.first
  #   depends_on = [aws_ec2_transit_gateway_vpc_attachment.mve]

  for_each = var.subnets

  transit_gateway_attachment_id  = var.transit_gateway_attachment_id
  transit_gateway_route_table_id = var.transit_gateway_route_table_id
}