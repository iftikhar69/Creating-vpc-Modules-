# AWS Infrastructure Automation with Terraform

This project automates the provisioning of a foundational AWS environment using **Terraform** and a **modular design pattern**.  
It’s built to provide a reusable, environment-driven setup that can be extended for application deployments, CI/CD pipelines, or infrastructure blueprints.

---

## 🏗️ Overview

The configuration defines and manages the following components:

- **VPC** — Uses AWS's default VPC for simplicity in early-stage environments.  
- **Security Group** — Configured to allow SSH, HTTP, and custom app traffic.  
- **EC2 Instance** — Launches a Linux server with configurable AMI, type, and storage.  
- **Key Pair** — Automatically imports your local public key for SSH access.  
- **DynamoDB Table** — Used for Terraform state locking or lightweight application data.  

Each module is written for clarity, portability, and compliance with best practices for infrastructure as code (IaC).

---

## 📁 Project Structure

Creating-vpc(Modules)/
├── main.tf # Root module invoking submodules
├── provider.tf # AWS provider configuration
├── terraform.tf # Backend and version constraints
├── infra-app/
│ ├── ec2.tf # EC2 instance, key pair, security group
│ ├── dynamodb.tf # DynamoDB table definition
│ ├── variables.tf # Module input variables
│ └── outputs.tf # Module outputs

---

## ⚙️ Prerequisites

- **Terraform** v1.6 or later  
- **AWS CLI** configured with valid credentials (`aws configure`)  
- IAM permissions for EC2, VPC, and DynamoDB  

---

## 🚀 Usage

### 1️⃣ Initialize Terraform
```bash
terraform init

2️⃣ Validate Configuration
terraform validate

3️⃣ Preview the Changes
terraform plan

4️⃣ Deploy Infrastructure
terraform apply

5️⃣ Destroy Resources (when done)
terraform destroy

| Variable                | Description                       | Example                  |
| ----------------------- | --------------------------------- | ------------------------ |
| `env`                   | Environment name (e.g. dev, prod) | `"dev"`                  |
| `instance_type`         | EC2 instance type                 | `"t3.micro"`             |
| `ec2_ami_id`            | AMI ID for your region            | `"ami-0abc123456789xyz"` |
| `ec2_root_storage_size` | Root volume size (GB)             | `10`                     |
| `instance_count`        | Number of EC2 instances           | `1`                      |

🧾 License

This project is licensed for personal and educational use.
For enterprise usage or customization, feel free to fork and adapt.

Author: Iftikhar
Stack: Terraform • AWS (EC2, VPC, DynamoDB) • Linux
Purpose: Scalable, environment-driven AWS provisioning using Terraform.