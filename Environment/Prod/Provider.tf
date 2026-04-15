data "aws_caller_identity" "current" {}

provider "aws" {
 region = "us-east-1"
}

provider "aws" {
 alias = "region2"
 region = "us-east-2"
}

