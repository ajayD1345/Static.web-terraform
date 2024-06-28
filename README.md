# Static Website Deployment on AWS using Terraform

## Overview
This project sets up the infrastructure for hosting a static website on AWS using Terraform. The infrastructure includes an S3 bucket, CloudFront distribution, Route 53 domain management, IAM roles and policies, API Gateway, and SSL certificates.

## Prerequisites
- AWS Account
- Domain name registered in Route 53
- Terraform installed on your local machine

## File Structure
- `api_gateway_config.tf`: Configuration for API Gateway.
- `api_gateway_resources.tf`: API Gateway resources definition.
- `certificate.tf`: SSL certificate configuration.
- `data.tf`: Data sources for Terraform.
- `init.tf`: Initialization configuration for Terraform.
- `main.tf`: Main infrastructure setup.
- `outputs.tf`: Outputs for Terraform.
- `permissions.tf`: IAM roles and policies.
- `README.md`: Project documentation.
- `route53.tf`: Route 53 DNS configuration.
- `variables.tf`: Variables used in the Terraform project.
- `s3-static-website.png`: Diagram of the infrastructure.

## Steps to Deploy
1. Clone the repository.
2. Modify `variables.tf` with your specific values.
3. Run `terraform init` to initialize the project.
4. Run `terraform plan` to review the changes.
5. Run `terraform apply` to deploy the infrastructure.

## Diagram
![Infrastructure Diagram](s3-static-website.png)

