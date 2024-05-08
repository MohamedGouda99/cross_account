variable "account_id" {
  description = "account ids"
  default     = "788376517154"
}
variable "aws_first_region" {
  description = "the preferred region to deploy"
  default     = "us-east-1"
}

variable "aws_second_region" {
  description = "the preferred region to deploy"
  default     = "us-east-1"
}

variable "transit_gateway_id" {
  type = string
}

variable "cidr_block" {
  type    = string
  default = "172.24.168.128/26"
}

# variable "subnet_ids" {
#   type = list(string)
# }

variable "subnet_details" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
  default = {
    mve_private_subnet_1 = {
      cidr_block        = "172.24.168.128/27"
      availability_zone = "us-east-1a"
    }
    mve_private_subnet_2 = {
      cidr_block        = "172.24.168.160/27"
      availability_zone = "us-east-1b"
    }
  }
}

variable "transit_gateway_name" {}
variable "aws_ec2_transit_gateway_route_table_name" {}


