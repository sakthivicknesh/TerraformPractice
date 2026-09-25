Terraform Practice - Day 2

This project is part of Terraform recall and practice.

Overview

In Day 2, I expanded my Terraform practice to make infrastructure definitions more modular, dynamic, and clean by separating configurations, parameterizing values with variables, and querying generated values using outputs.

The configuration demonstrates:

Organizing Terraform configurations across multiple files (main.tf, variables.tf, outputs.tf)

Defining and using input variables for dynamic configurations

Handling resource outputs to expose infrastructure metadata

Provisioning AWS resources with flexible, parameterized values

Architecture

Terraform Configuration (main.tf / variables.tf / outputs.tf)
    |
    v
AWS Provider
    |
    v
AWS Infrastructure Components
    |
    +-- Region: Configured via variables
    +-- Resource Provisioning (Parameterized AMI, Instance Type, Networking)
    +-- Output Attributes (Public IPs, Resource IDs)


Prerequisites

Before running this project, make sure you have:

Terraform installed

AWS CLI installed

AWS credentials configured

An AWS account

Any existing VPC/Subnet IDs or Key Pairs needed for parameter values

Terraform Commands

1. Initialize Terraform

terraform init


2. Format the Configuration

terraform fmt


3. Validate the Configuration

terraform validate


Expected output:

Success! The configuration is valid.


4. Create an Execution Plan

terraform plan


5. Apply the Configuration

terraform apply


6. Inspect Outputs

terraform output


7. Destroy the Infrastructure

When the practice is complete:

terraform destroy


Learning Objectives

This exercise helps understand:

Declaring and referencing input variables (variables.tf)

Exposing configuration results via outputs (outputs.tf)

Multi-file Terraform project structure

Clean code formatting with terraform fmt

Parameterizing resource attributes (e.g., AMI, instance type, tags)

Terraform execution lifecycle management (init, validate, plan, apply, destroy)

Terraform Workflow

Write Configuration (main.tf, variables.tf, outputs.tf)
       |
       v
terraform fmt
       |
       v
terraform init
       |
       v
terraform validate
       |
       v
terraform plan
       |
       v
terraform apply
       |
       v
AWS Infrastructure Deployed (Check `terraform output`)
       |
       v
terraform destroy


Important Note

Always verify your variable defaults or terraform.tfvars file to make sure region-specific parameters (such as AMI IDs, Subnet IDs, and Key Pairs) match your target AWS account and region before running terraform apply.

Author

Sakthi Vicknesh