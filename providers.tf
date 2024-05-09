provider "aws" {
  alias = "first"

  region  = var.aws_first_region
  profile = "first_account"
}


provider "aws" {
  alias = "second"

  region  = var.aws_second_region
  profile = "second_account"
}


