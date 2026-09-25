# Terraform Practice - Day 1

This project is part of Terraform recall and practice.

## Overview

In Day 1, I created an AWS EC2 instance using Terraform.

The configuration demonstrates the basic Terraform workflow:

* Configure the AWS provider
* Select an AWS region
* Create an EC2 instance
* Specify an AMI
* Select an instance type
* Deploy the instance into a specific subnet
* Use an existing EC2 key pair

## Architecture

Terraform
    |
    v
AWS Provider
    |
    v
AWS EC2
    |
    +-- AMI: Ubuntu Server
    +-- Instance Type: t3.micro
    +-- Region: us-east-1
    +-- Availability Zone: us-east-1a
    +-- Subnet: Existing AWS subnet
    +-- Key Pair: E-com



## Prerequisites

Before running this project, make sure you have:

* Terraform installed
* AWS CLI installed
* AWS credentials configured
* An AWS account
* The specified subnet available in your AWS account
* The EC2 key pair available in your AWS account
* The specified AMI available in your preffered region


## Terraform Commands

### 1. Initialize Terraform

terraform init


### 3. Validate the configuration


terraform validate


Expected output:
Success! The configuration is valid.


### 4. Create an execution plan


terraform plan


### 5. Create the EC2 instance


terraform apply


### 6. Destroy the infrastructure

When the practice is complete:

terraform destroy


## Project Structure

```text
TerraformPractice/
│
├── Day_1/
│   ├── main.tf
│   └── README.md
│
└── README.md
```

## Learning Objectives

This exercise helps understand:

1. Terraform provider configuration
2. Terraform resources
3. AWS EC2 provisioning
4. AMI selection
5. EC2 instance types
6. Subnet selection
7. EC2 key pairs
8. Terraform initialization
9. Terraform validation
10. Terraform plan and apply
11. Terraform destroy

## Terraform Workflow

```text
Write Configuration
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
AWS Infrastructure
       |
       v
terraform destroy
```

## Important Note

The AMI ID, subnet ID, and key pair are account/region-specific values.

If you use this configuration in another AWS account or region, verify these values before running `terraform apply`.

## Author

**Sakthi Vicknesh**

