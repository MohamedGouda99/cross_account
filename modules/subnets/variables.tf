variable "subnet_details" {
  description = "Details of subnets"
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
}


variable "vpc_id" {

}