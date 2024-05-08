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
resource "aws_subnet" "subnets" {
  provider          = aws.second
  for_each          = local.subnets
  vpc_id            = var.vpc_id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  tags = {
    Name = each.key
  }
}