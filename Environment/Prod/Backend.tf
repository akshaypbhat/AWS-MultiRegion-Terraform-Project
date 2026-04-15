terraform {
 backend "s3" {
  bucket = "global-scale-project"
  key = "prod/network/terraform.tfstate"
  region = "us-east-1"
  dynamodb_table = "MultiAZ-tfstate"
  encrypt = true
 }
}


