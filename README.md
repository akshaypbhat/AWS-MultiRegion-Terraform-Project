# 🌍 AWS Global Multi-Region Infrastructure-as-Code

[![Terraform](https://img.shields.io/badge/Terraform-1.0+-623CE4.svg?style=for-the-badge&logo=terraform)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-Cloud-232F3E.svg?style=for-the-badge&logo=amazon-aws)](https://aws.amazon.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

## 📌 Project Overview
This repository contains a production-grade, highly available global network architecture deployed across multiple AWS regions (**us-east-1** and **us-east-2**). The project demonstrates advanced **Infrastructure as Code (IaC)** principles, focusing on modularity, security, and cross-region connectivity.

## 🏗 Architecture Features
* **Hub-and-Spoke Networking:** Centralized traffic management using **AWS Transit Gateway (TGW)**.
* **Cross-Region Peering:** Automated peering between TGWs to allow private, low-latency communication between Mumbai and N. Virginia VPCs.
* **Modular Design:** 100% reusable code structure with dedicated modules for VPCs, Security Groups, and Networking.
* **Hybrid Subnetting:** Logical separation of Public and Private subnets with **NAT Gateway** integration for secure outbound internet access.
* **Enterprise State Management:** Remote state storage in **S3** with state locking via **DynamoDB** to ensure team collaboration integrity.

## 🛠 Tech Stack & Services
* **Terraform:** HCL, Modules, Provider Aliasing, Remote Backends.
* **AWS VPC:** Subnets, Route Tables, IGW, NAT Gateway, EIP.
* **AWS Transit Gateway:** Cross-region peering, VPC attachments, and Route Table propagation.
* **AWS Security:** Security Groups (Stateful firewalls) with "Least Privilege" ingress/egress rules.
* **AWS Storage & DB:** S3 (State storage) and DynamoDB (Locking mechanism).
