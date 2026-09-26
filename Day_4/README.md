# Terraform Practice - Day 4

This project is part of Terraform recall and practice.

## Overview

In Day 4, I focused on Terraform state management and collaboration. This involves shifting from local state storage to a remote backend, enabling multiple team members to work on the same infrastructure simultaneously without conflicts.

The configuration demonstrates:

* Configuring a remote backend using AWS S3 for secure state storage

* Implementing state locking using AWS DynamoDB to prevent concurrent executions

* Managing and interacting with the Terraform state file using CLI commands

* Understanding how Terraform tracks deployed resources

## Architecture

```text
Terraform Configuration (Backend Configured)
    |
    v
AWS Provider
    |
    +--> AWS S3 Bucket (Stores terraform.tfstate securely)
    |
    +--> AWS DynamoDB Table (Handles State Locking via LockID)
    |
    v
AWS Infrastructure Components
    |
    +-- Target Provisioned Resources (EC2, VPC, etc.)

```

## Prerequisites

Before running this project, make sure you have:

* Terraform installed

* AWS CLI installed

* AWS credentials configured

* An AWS account

* An existing S3 Bucket (for state storage)

* An existing DynamoDB Table with a Partition Key named `LockID` (for state locking)

## Terraform Commands

### 1. Initialize Terraform (with Backend)

```bash
terraform init

```

### 2. Format the Configuration

```bash
terraform fmt

```

### 3. Validate the Configuration

```bash
terraform validate

```

Expected output:

```text
Success! The configuration is valid.

```

### 4. Create an Execution Plan

```bash
terraform plan

```

### 5. Apply the Configuration

```bash
terraform apply

```

### 6. Inspect Terraform State

```bash
terraform state list
terraform state show <resource_name>

```

### 7. Destroy the Infrastructure

When the practice is complete:

```bash
terraform destroy

```

## Learning Objectives

This exercise helps understand:

1. The importance of the `terraform.tfstate` file

2. Configuring an S3 backend block in `terraform { ... }`

3. Preventing state corruption using DynamoDB state locking

4. Using `terraform state` commands to inspect and manipulate tracked resources

5. Best practices for team collaboration on Terraform projects

## Terraform Workflow

```text
Write Configuration (Define S3 & DynamoDB backend)
       |
       v
terraform fmt
       |
       v
terraform init (Initializes remote state backend)
       |
       v
terraform validate
       |
       v
terraform plan (Acquires State Lock)
       |
       v
terraform apply (Modifies infrastructure & updates S3 state)
       |
       v
AWS Infrastructure Deployed / Updated
       |
       v
terraform destroy (Acquires lock, destroys resources, updates state)

```

## Important Note

You must manually create the S3 bucket and DynamoDB table before running `terraform init`. But I have created the DynamoDB using terraform to just to understand the structure. Ensure the S3 bucket has versioning enabled and the DynamoDB table has a primary key strictly named `LockID` (String) for the locking mechanism to function.

## Author

**Sakthi Vicknesh**