terraform {
  required_providers {
    aws = {
      source                = "harshicorp/aws"
      configuration_aliases = [ aws ]
    }
  }
}

resource "aws_security_group" "web_sg" {
  name        = "web-sg-${var.region_name}"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = var.vpc_id

  # Inbound: SSH (Port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound: HTTP (Port 80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound: Allow everything
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg-${var.region_name}"
  }
}
