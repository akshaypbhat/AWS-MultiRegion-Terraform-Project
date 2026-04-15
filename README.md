# AWS Multi-Region Global Infrastructure with Terraform

## Architecture Overview
This project demonstrates a production-grade, multi-region AWS network architecture managed entirely via Terraform. It features two VPCs (Mumbai and N. Virginia) connected through a Transit Gateway Peering bridge.

## Key Features
* **Multi-Region Deployment:** Utilizes Terraform provider aliasing to manage infrastructure across different AWS regions simultaneously.
* **Modular Design:** Clean separation of concerns with dedicated modules for VPCs, Security Groups, and Transit Gateways.
* **Global Connectivity:** Cross-region Transit Gateway peering with automated acceptance logic.
* **Security & Scalability:** Private/Public subnet architecture with NAT Gateways and unified Security Group baselines.
* **State Management:** Remote S3 backend with DynamoDB state locking to prevent concurrent modification.

## Tools Used
* Terraform (HCL)
* AWS (VPC, TGW, EC2, S3, DynamoDB)

