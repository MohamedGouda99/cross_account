output "transit_gateway_attachment_ids" {
  value = [for attachment in aws_ec2_transit_gateway_vpc_attachment.mve : attachment.id]
}
