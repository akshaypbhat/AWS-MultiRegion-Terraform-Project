variable "vpc_id" {
  type        = string
  description = "The ID of the VPC to attach"
}

variable "private_subnet_id" {
  type        = string
  description = "The ID of the private subnet for the TGW attachment"
}

variable "region_name" {
  type        = string
  description = "The name of the region"
}


