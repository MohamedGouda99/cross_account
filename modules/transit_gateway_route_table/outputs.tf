output "aws_ec2_transit_gateway_route_table_id" {
  value = data.aws_ec2_transit_gateway_route_table.existing.id
}