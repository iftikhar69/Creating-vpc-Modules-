<<<<<<< HEAD
#  Terraform Modular AWS Infrastructure

This repository contains a **modular Terraform setup** designed to provision AWS infrastructure environments — **dev**, **staging**, and **production** — using reusable modules.  
It allows you to spin up isolated, consistent environments with minimal configuration.

---

## 📘 Overview
=======
AWS Infrastructure Automation with Terraform

This project automates the provisioning of AWS infrastructure using Terraform and a modular design pattern.
It’s built to provide a reusable, environment-driven setup that can be extended for application deployments, CI/CD pipelines, or infrastructure blueprints.

🏗️ Overview
>>>>>>> 5ab02b7 (Initial commit: Terraform modular AWS infrastructure setup)

The goal of this project is to **automate cloud provisioning** using Terraform with a clean modular structure.  
Each environment (e.g., dev, stg, prod) shares reusable Terraform code while maintaining independent variables and resources.

<<<<<<< HEAD
This setup follows **Infrastructure as Code (IaC)** principles and is ideal for:
- DevOps engineers learning Terraform modules
- Teams managing multiple AWS environments
- Automating repeatable cloud deployments
=======
VPC — Uses AWS’s default VPC for simplicity in early-stage environments.

Security Group — Configured to allow SSH, HTTP, and custom app traffic.
>>>>>>> 5ab02b7 (Initial commit: Terraform modular AWS infrastructure setup)

EC2 Instance — Launches a Linux server with configurable AMI, type, and storage.

<<<<<<< HEAD
## 🧩 Architecture Diagram

Below is a high-level view of how this setup works — combining Terraform and Ansible to manage multiple AWS environments:

![Project-design](https://github.com/user-attachments/assets/b08757cb-7433-455a-a4f2-7f598ad193a5)

---

## 🏗️ Components

| Component | Description |
|------------|--------------|
| **Terraform (TF)** | Used to provision AWS resources such as EC2, VPCs, Security Groups, and S3 buckets. |
| **Modules** | Encapsulate resources for reusability and maintainability across environments. |
| **Ansible (optional)** | Handles post-deployment configuration (e.g., software installs). |
| **Inventories** | Separate environment definitions: `dev`, `stg`, `prod`. |
| **AWS Key Pair** | Automatically creates and attaches a key for SSH access. |

---

## 📂 Project Structure
Creating-vpc-Modules/
│
├── infra-app/
│ ├── ec2.tf # EC2 instance definition
│ ├── s3.tf # S3 bucket configuration
│ ├── dynamodb.tf # DynamoDB table definition
│ ├── variable.tf # Variables for infra module
│
├── mian.tf # Root module configuration
├── provider.tf # AWS provider setup
├── terraform.tf # Terraform backend and state configuration
├── .gitignore # Ignored sensitive & Terraform files
└── README.md

=======
Key Pair — Automatically imports your local public key for SSH access.

S3 Bucket — Environment-specific storage used for remote state or application data.

DynamoDB Table — Used for Terraform state locking or lightweight application data.

Each module is written for clarity, portability, and compliance with best practices for Infrastructure as Code (IaC).

📁 Project Structure
Creating-VPC(Modules)/
├── main.tf               # Root module invoking submodules for dev/stg/prd
├── provider.tf           # AWS provider configuration
├── terraform.tf          # Backend and version constraints
├── infra-app/
│   ├── ec2.tf            # EC2 instance, key pair, security group
│   ├── s3.tf             # S3 bucket definition
│   ├── dynamodb.tf       # DynamoDB table definition
│   ├── variables.tf      # Module input variables
│   └── outputs.tf        # Module outputs
├── terra-key-ec2.pub     # Public SSH key for EC2 access
└── Readme.md             # Project documentation
>>>>>>> 5ab02b7 (Initial commit: Terraform modular AWS infrastructure setup)

⚙️ Prerequisites

<<<<<<< HEAD
## ⚙️ How to Use

1. **Clone the Repository**
   ```bash
   git clone https://github.com/iftikhar69/Creating-vpc-Modules-.git
   cd Creating-vpc-Modules-
2. Initialize Terraform
=======
Terraform v1.6 or later

AWS CLI configured with valid credentials (aws configure)

IAM permissions for EC2, VPC, S3, and DynamoDB

🚀 Usage
1️⃣ Initialize Terraform
>>>>>>> 5ab02b7 (Initial commit: Terraform modular AWS infrastructure setup)
terraform init

3. Validate the Configuration
terraform validate

4. Plan and Apply
terraform plan
terraform apply -auto-approve

5. Destroy (when done)
terraform destroy -auto-approve

🧭 Future Improvements

<<<<<<< HEAD
Add Terraform backend (S3 + DynamoDB) for remote state management
=======
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
>>>>>>> 5ab02b7 (Initial commit: Terraform modular AWS infrastructure setup)

Integrate CI/CD pipeline (GitHub Actions) for automated deployments

Expand modules for RDS, Load Balancer, and IAM roles

<<<<<<< HEAD
Add Ansible playbooks for full configuration management

👨‍💻 Author

Iftikhar hussain
DevOps Engineer passionate about automating infrastructure and improving cloud reliability.

📧 [Email (ifikharali081144@gmail.com)]
🌐 GitHub Profile

🏁 License

This project is licensed under the MIT License — free to use, modify, and share.
=======
Author: Iftikhar
Stack: Terraform • AWS (EC2, VPC, S3, DynamoDB) • Linux
Purpose: Scalable, environment-driven AWS provisioning using Terraform.
>>>>>>> 5ab02b7 (Initial commit: Terraform modular AWS infrastructure setup)
