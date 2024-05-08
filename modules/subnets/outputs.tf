output "subnet_ids" {
  value = [for subnet_key, subnet in aws_subnet.subnets : subnet.id]
}


output "subnets" {
  value = aws_subnet.subnets
}