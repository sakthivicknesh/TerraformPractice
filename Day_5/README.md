# Terraform Practice - Day 5

This project is part of Terraform recall and practice.

## Overview

In Day 5, I expanded my Terraform practice by building a custom network infrastructure from scratch and using Terraform **Provisioners** to automatically configure an EC2 instance and deploy a web application.

The configuration demonstrates:

* Creating a custom VPC, Subnet, Internet Gateway, and Route Table for public internet access

* Defining a Security Group to allow HTTP (80) and SSH (22) traffic

* Provisioning an AWS EC2 instance within the custom networking setup

* Using the `connection` block to connect to the instance via SSH

* Utilizing the `file` provisioner to transfer a Python Flask app (`app.py`) to the server

* Utilizing the `remote-exec` provisioner to install dependencies, configure the environment, and start the web server automatically

## Architecture

```
Terraform Configuration (main.tf, app.py)
    |
    v
AWS Provider (us-east-1)
    |
    v
Custom VPC (10.0.0.0/16)
    |
    +-- Internet Gateway (IGW) & Route Table
    |
    +-- Public Subnet (10.0.0.0/24 in us-east-1a)
          |
          +-- Security Group (Ports 80, 22)
          |
          +-- EC2 Instance (Ubuntu, t3.micro)
                |
                +-- Provisioner: file (Copies app.py)
                +-- Provisioner: remote-exec (Installs Python/Flask, starts app)


```

## Prerequisites

Before running this project, make sure you have:

* Terraform installed

* AWS CLI installed

* AWS credentials configured

* An AWS account

* An EC2 key pair available in your AWS account

* The private key file downloaded and located at `/Users/sakthi/Downloads/E-com.pem `in my case (update this path in `main.tf` if your key is stored elsewhere)

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

### 6. Verify the Deployment

Once applied, grab the public IP address of the EC2 instance from your AWS console and open it in a web browser:

```
http://<EC2_PUBLIC_IP>


```

*Expected output on the web page: "Hello, Terraform!"*

### 7. Destroy the Infrastructure

When the practice is complete:

```
terraform destroy


```

## Learning Objectives

This exercise helps understand:

1. Building a custom VPC and networking components from scratch

2. Routing traffic via Internet Gateways and Route Tables

3. Creating and attaching Security Groups for specific inbound rules

4. Configuring Terraform `connection` blocks for SSH access

5. Using the `file` provisioner to move local scripts/files to remote instances

6. Using the `remote-exec` provisioner to run shell commands, update packages, and launch background applications

7. Fully automating infrastructure deployment alongside application configuration

## Terraform Workflow

```
Write Configuration (main.tf & app.py)
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
AWS Infrastructure Deployed & App Started
       |
       v
terraform destroy


```

## Important Note

The `connection` block uses an absolute local path for the SSH private key (`/Users/sakthi/Downloads/E-com.pem`). If you run this code on a different machine, ensure the path points to the correct `.pem` file location.

## Author

**Sakthi Vicknesh**