# 🚀 Terraform Modular AWS Infrastructure

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

Below is a high-level view of how this setup works — combining Terraform and Ansible to manage multiple AWS environments:

![Terraform Multi-Environment Architecture](./688c24ea-d66e-426a-8f13-9e55021b2515.gif)

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


---

## ⚙️ How to Use

1. **Clone the Repository**
   ```bash
   git clone https://github.com/iftikhar69/Creating-vpc-Modules-.git
   cd Creating-vpc-Modules-
2. Initialize Terraform
terraform init

3. Validate the Configuration
terraform validate

4. Plan and Apply
terraform plan
terraform apply -auto-approve

5. Destroy (when done)
terraform destroy -auto-approve

🧭 Future Improvements

Add Terraform backend (S3 + DynamoDB) for remote state management

Integrate CI/CD pipeline (GitHub Actions) for automated deployments

Expand modules for RDS, Load Balancer, and IAM roles

Add Ansible playbooks for full configuration management

👨‍💻 Author

Iftikhar hussain
DevOps Engineer passionate about automating infrastructure and improving cloud reliability.

📧 [Email (optional)]
🌐 GitHub Profile

🏁 License

This project is licensed under the MIT License — free to use, modify, and share.
