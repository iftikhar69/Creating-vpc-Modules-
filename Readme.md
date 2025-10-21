# 🏗️ Terraform Modular AWS Infrastructure

This repository contains a **modular Terraform setup** designed to provision AWS infrastructure environments — **dev**, **staging**, and **production** — using reusable modules.  
It allows you to spin up isolated, consistent environments with minimal configuration.

---

## 📘 Overview

The goal of this project is to **automate cloud provisioning** using Terraform with a clean modular structure.  
Each environment (e.g., dev, stg, prod) shares reusable Terraform code while maintaining independent variables and resources.

This setup follows **Infrastructure as Code (IaC)** principles and is ideal for:
- DevOps engineers learning Terraform modules
- Teams managing multiple AWS environments
- Automating repeatable cloud deployments

---

## 🧩 Architecture Diagram

Below is a high-level view of how this setup works — combining Terraform (and optionally Ansible) to manage multiple AWS environments:

![Project-design](https://github.com/user-attachments/assets/b08757cb-7433-455a-a4f2-7f598ad193a5)

---

## 🏗️ Components

| Component | Description |
|------------|--------------|
| **VPC** | Uses AWS’s default VPC for simplicity in early-stage environments. |
| **Security Group** | Configured to allow SSH, HTTP, and custom app traffic. |
| **EC2 Instance** | Launches a Linux server with configurable AMI, type, and storage. |
| **Key Pair** | Automatically imports your local public key for SSH access. |
| **S3 Bucket** | Environment-specific storage used for remote state or application data. |
| **DynamoDB Table** | Used for Terraform state locking or lightweight application data. |

Each module is written for clarity, portability, and compliance with best practices for Infrastructure as Code (IaC).

---

## 📂 Project Structure
Creating-vpc-Modules/
│
├── infra-app/
│ ├── ec2.tf # EC2 instance definition
│ ├── s3.tf # S3 bucket configuration
│ ├── dynamodb.tf # DynamoDB table definition
│ ├── variables.tf # Variables for infra module
│ └── outputs.tf # Module outputs
│
├── main.tf # Root module configuration
├── provider.tf # AWS provider setup
├── terraform.tf # Terraform backend and state configuration
├── .gitignore # Ignored sensitive & Terraform files
├── terra-key-ec2.pub # SSH public key for EC2 access
└── README.md


---

## ⚙️ Prerequisites

- **Terraform** v1.6 or later  
- **AWS CLI** configured with valid credentials (`aws configure`)  
- IAM permissions for EC2, VPC, S3, and DynamoDB  

---

## 🚀 How to Use

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/iftikhar69/Creating-vpc-Modules-.git
cd Creating-vpc-Modules-

2️⃣ Initialize Terraform
terraform init

3️⃣ Validate Configuration
terraform validate

4️⃣ Plan and Apply Changes
terraform plan
terraform apply -auto-approve

5️⃣ Destroy Resources (when done)
terraform destroy -auto-approve

🌍 Multi-Environment Setup

Each environment (dev, stg, prd) is declared in main.tf and uses the same module with its own variables:
module "iftu-dev-infra" {
  source                = "./infra-app"
  env                   = "dev"
  bucket_name           = "dev-iftu-bucket-s3"
  instance_count        = 1
  instance_type         = "t3.micro"
  ec2_root_storage_size = 15
  ec2_ami_id            = "ami-0933f1385008d33c4"
  hash_key              = "studentID"
}

module "iftu-stg-infra" {
  source                = "./infra-app"
  env                   = "stg"
  bucket_name           = "stg-iftu-bucket-s3"
  instance_count        = 1
  instance_type         = "t3.micro"
  ec2_root_storage_size = 15
  ec2_ami_id            = "ami-0933f1385008d33c4"
  hash_key              = "studentID"
}

module "iftu-prd-infra" {
  source                = "./infra-app"
  env                   = "prd"
  bucket_name           = "prd-iftu-bucket-s3"
  instance_count        = 1
  instance_type         = "t3.micro"
  ec2_root_storage_size = 15
  ec2_ami_id            = "ami-0933f1385008d33c4"
  hash_key              = "studentID"
}

| Variable                | Description                      | Example                   |
| ----------------------- | -------------------------------- | ------------------------- |
| `env`                   | Environment name (e.g. dev, prd) | `"dev"`                   |
| `bucket_name`           | S3 bucket name per environment   | `"dev-iftu-bucket-s3"`    |
| `instance_type`         | EC2 instance type                | `"t3.micro"`              |
| `ec2_ami_id`            | AMI ID for your region           | `"ami-0933f1385008d33c4"` |
| `ec2_root_storage_size` | Root volume size (GB)            | `15`                      |
| `instance_count`        | Number of EC2 instances          | `1`                       |
| `hash_key`              | DynamoDB primary key             | `"studentID"`             |

🧭 Future Improvements

Add Terraform backend (S3 + DynamoDB) for remote state management

Integrate CI/CD pipeline (GitHub Actions) for automated deployments

Expand modules for RDS, Load Balancer, and IAM roles

Add Ansible playbooks for full configuration management

👨‍💻 Author

Iftikhar Hussain
DevOps Engineer passionate about automating infrastructure and improving cloud reliability.

📧 Email: ifikharali081144@gmail.com
🌐 GitHub: iftikhar69
🏁 License

This project is licensed under the MIT License — free to use, modify, and share.