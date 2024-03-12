# Terraform-Project

#Terraform Infrastructure Deployment README

#Overview

This Terraform project deploys infrastructure across multiple AWS regions using multiple providers. It includes an EC2 instance, a VPC , a DynamoDB table, and an S3 bucket.

#Prerequisites

Terraform installed.
AWS account with appropriate permissions.
Basic understanding of Terraform and AWS.

#Setup

Clone the repository.
Create terraform.tfvars with AWS credentials and other variables.
Run terraform init to initialize.
Configure backend settings in backend.tf.

#Configuration

Instance type set in ec2_instance module.
AMI can be set in variable files or conditioned variable in the module.
Statefile stored in backend with locking for consistency.
Multiple providers used for two regions.
Explicit dependencies ensure database is provisioned before EC2.
Functions used for instance naming.

#Deployment

Review plan with terraform plan.
Apply configuration with terraform apply.

#Clean Up

Destroy resources with terraform destroy when no longer needed.
