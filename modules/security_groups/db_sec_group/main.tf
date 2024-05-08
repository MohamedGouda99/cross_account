provider "aws" {
  alias   = "first"
  region  = "us-east-1"
  profile = "first_account"
}

provider "aws" {
  alias   = "second"
  region  = "us-east-1"
  profile = "second_account"
}

resource "aws_security_group" "db_security_group" {
  provider = aws.second
  name     = "db_security_group"
  vpc_id   = var.vpc_id

  dynamic "ingress" {
    for_each = var.db_security_group
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.egress_rule
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }

  }
}


