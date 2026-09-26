# Terraform Practice - Day 3

This project is part of Terraform recall and practice.

## Overview

In Day 3, I advanced my Terraform practice by implementing state management and modular infrastructure. This includes configuring a remote backend and creating reusable Terraform modules to structure configurations more effectively.

The configuration demonstrates:

* Configuring a remote backend (e.g., AWS S3 and DynamoDB for state locking)

* Building and utilizing custom Terraform modules

* Managing infrastructure state securely

* Reusing code to provision AWS resources efficiently

## Architecture

```
Terraform Configuration (Modules / Remote Backend)
    |
    v
AWS Provider
    |
    v
AWS Infrastructure Components
    |
    +-- Remote State: S3 Bucket & DynamoDB Table
    +-- Modular Deployments (VPC, EC2, etc.)
    +-- Parameterized Module Inputs & Outputs

```

## Prerequisites

Before running this project, make sure you have:

* Terraform installed

* AWS CLI installed

* AWS credentials configured

* An AWS account

* Pre-configured S3 bucket and DynamoDB table (if using remote state)

## Terraform Commands

### 1. Initialize Terraform

```
terraform init

```

### 2. Format the Configuration

```
terraform fmt

```

### 3. Validate the Configuration

```
terraform validate

```

Expected output:

```
Success! The configuration is valid.

```

### 4. Create an Execution Plan

```
terraform plan

```

### 5. Apply the Configuration

```
terraform apply

```

### 6. Inspect Outputs

```
terraform output

```

### 7. Destroy the Infrastructure

When the practice is complete:

```
terraform destroy

```

## Learning Objectives

This exercise helps understand:

1. Implementing remote state backends for collaboration and security

2. Using state locking mechanisms to prevent concurrent modifications

3. Creating and consuming Terraform modules for code reusability

4. Passing variables into modules and extracting outputs from them

5. Managing complex dependencies between modularized resources

## Terraform Workflow

```
Write Configuration (Modules & Backend setup)
       |
       v
terraform fmt
       |
       v
terraform init (Downloads modules & configures backend)
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
AWS Infrastructure Deployed via Modules
       |
       v
terraform destroy

```

## Important Note

When using a remote backend, ensure that your S3 bucket and DynamoDB table exist before running `terraform init`. Verify your module input variables match your target AWS environment.

## Author

**Sakthi Vicknesh**