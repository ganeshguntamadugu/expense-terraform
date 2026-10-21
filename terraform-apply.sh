#!/bin/bash

set -e

echo "=============================="
echo " Starting Terraform Deployment"
echo "=============================="

# VPC
echo "Deploying VPC..."
cd 10-vpc
terraform init
terraform apply -auto-approve
cd ..

# Security Groups
echo "Deploying Security Groups..."
cd 20-sg
terraform init
terraform apply -auto-approve
cd ..

# Bastion
echo "Deploying Bastion..."
cd 30-bastion
terraform init
terraform apply -auto-approve
cd ..

# Application
echo "Deploying Application..."
cd 40-application
terraform init
terraform apply -auto-approve
cd ..

echo "=============================="
echo " Terraform Deployment Complete"
echo "=============================="


# for i in $(ls -dr */) ; do echo ${i%/}; cd  ${i%/} ; terraform destroy -auto-approve ; cd .. ; done

# for i in $(ls -d */) ; do echo ${i%/}; cd  ${i%/} ; terraform apply -auto-approve ; cd .. ; done

