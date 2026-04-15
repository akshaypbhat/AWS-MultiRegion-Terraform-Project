# Fetch the Account ID for Peering
data "aws_caller_identity" "current" {}

# Region 1 VPC
module "vpc_region_1" {
  source      = "../../modules/vpc"
  region_name = var.region_1_name
  vpc_cidr    = var.vpc_cidr_1
}

# Region 2 VPC
module "vpc_region_2" {
  source      = "../../modules/vpc"
  region_name = var.region_2_name
  vpc_cidr    = var.vpc_cidr_2
  providers   = { aws = aws.region2 }
}

# Transit Gateway Region 1
module "tgw_region_1" {
  source            = "../../modules/tgw"
  vpc_id            = module.vpc_region_1.vpc_id
  private_subnet_id = module.vpc_region_1.private_subnet_id
  region_name       = var.region_1_name
  providers         = { aws = aws }
}

# Transit Gateway Region 2
module "tgw_region_2" {
  source            = "../../modules/tgw"
  vpc_id            = module.vpc_region_2.vpc_id
  private_subnet_id = module.vpc_region_2.private_subnet_id
  region_name       = var.region_2_name
  providers         = { aws = aws.region2 }
}

# TGW Peering Attachment (Requested from Region 1)
resource "aws_ec2_transit_gateway_peering_attachment" "cross_region" {
  peer_account_id         = data.aws_caller_identity.current.account_id
  peer_region             = var.region_2_name
  peer_transit_gateway_id = module.tgw_region_2.tgw_id
  transit_gateway_id      = module.tgw_region_1.tgw_id
}

# TGW Peering Accepter (Accepted in Region 2)
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "region_2_accept" {
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.cross_region.id
  provider                      = aws.region2
}

# Security Groups
module "sg_region_1" {
  source      = "../../modules/sg"
  vpc_id      = module.vpc_region_1.vpc_id
  region_name = var.region_1_name
  providers   = { aws = aws }
}

module "sg_region_2" {
  source      = "../../modules/sg"
  vpc_id      = module.vpc_region_2.vpc_id
  region_name = var.region_2_name
  providers   = { aws = aws.region2 }
}
