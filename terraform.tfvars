transit_gateway_id                       = "tgw-01e50170e55dd32eb"
transit_gateway_name                     = "STNO-TGW-us-east-1"
aws_ec2_transit_gateway_route_table_name = "Isolated"
cidr_block                               = "172.24.168.128/26"
subnet_details = {
  mve_private_subnet_1 = {
    cidr_block        = "172.24.168.128/27"
    availability_zone = "us-east-1a"
  }
  mve_private_subnet_2 = {
     cidr_block        = "172.24.168.160/27"
     availability_zone = "us-east-1b"
  }
}
