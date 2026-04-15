terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [ aws ]
    }
  }
}

resource "aws_ec2_transit_gateway" "main {
  description = "Transit Gateway for ${var.region_name}"
  tags = {
    Name = "tgw-${var.region_name}"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_attach" {
  subnet_ids         = [var.private_subnet_id]
  transit_gateway_id = aws_ec2_transit_gateway.main.id
  vpc_id             = var.vpc_id

  tags = {
    Name = "tgw-attachment-${var.region_name}"
  }
}

