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



resource "aws_vpc" "vpc" {
  provider   = aws.second
  cidr_block = var.cidr_block
  tags = {
    Name = "mve_vpc"
  }
}