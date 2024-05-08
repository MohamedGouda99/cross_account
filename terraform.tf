terraform {
  #   backend "s3" {
  #     bucket         = "arun-terraform-state-backend-test-363652623632"
  #     key            = "terraform.tfstate"
  #     region         = "us-east-1"
  #     dynamodb_table = "arun-terraform-state-lock"
  #   }
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = ">= 2.7.0"
      configuration_aliases = [aws.first, aws.second]
    }
  }
}