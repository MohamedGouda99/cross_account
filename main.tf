module "aws_ec2_transit_gateway" {
  providers = {
    aws = aws.first
  }
  source               = "./modules/aws_ec2_transit_gateway"
  transit_gateway_id   = var.transit_gateway_id
  transit_gateway_name = var.transit_gateway_name
}

module "aws_ec2_transit_gateway_route_table" {
  providers = {
    aws = aws.first
  }
  source                                   = "./modules/transit_gateway_route_table"
  aws_ec2_transit_gateway_route_table_name = var.aws_ec2_transit_gateway_route_table_name
}

module "subnets" {
  providers = {
    aws = aws.second
  }
  source         = "./modules/subnets"
  subnet_details = var.subnet_details
  vpc_id         = module.vpc.vpc_id
}


module "vpc" {
  providers = {
    aws = aws.second
  }
  source     = "./modules/vpc"
  cidr_block = var.cidr_block
}
module "transit_gateway_vpc_attachment" {
  providers = {
    aws = aws.second
  }
  source             = "./modules/transit_gateway_vpc_attachment"
  subnets            = module.subnets.subnets
  transit_gateway_id = module.aws_ec2_transit_gateway.aws_ec2_transit_gateway_id
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.subnets.subnet_ids
}

module "transit_gateway_route_table_association" {
  providers = {
    aws = aws.first
  }
  source                         = "./modules/transit_gateway_route_table_association"
  subnets                        = module.subnets.subnets
  transit_gateway_attachment_id  = join(",", module.transit_gateway_vpc_attachment.transit_gateway_attachment_ids)
  transit_gateway_route_table_id = module.aws_ec2_transit_gateway_route_table.aws_ec2_transit_gateway_route_table_id
}

module "web_sec_group" {
  source = "./modules/security_groups/web_sec_group"
  vpc_id = module.vpc.vpc_id
}

module "app_sec_group" {
  source = "./modules/security_groups/app_sec_group"
  vpc_id = module.vpc.vpc_id
}

module "db_security_group" {
  source = "./modules/security_groups/db_sec_group"
  vpc_id = module.vpc.vpc_id
}