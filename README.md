# End to End Production Grade Deployment on AWS ECS Fargate - [Go Application]

This project demonstrates a production-grade deployment of a Go application on AWS ECS Fargate, with all infrastructure provisioned using Terraform and a fully automated CI/CD pipeline using GitHub Actions.

The setup follows modern DevOps best practices: modular infrastructure as code, private networking, secure image delivery, HTTPS termination, automated security scanning, and remote Terraform state management.

## Architecture Overview

![Architecture Diagram](assets/ecs-architecture.png)

## Live Deployment



https://github.com/user-attachments/assets/31845c59-afc8-4268-b564-0d98852f5bda



## Deployment Verification

- [Healthy Target Group](assets/healthy-target-group.png)
- [Live Domain](assets/live-domain-https.png)
- [ECS Running](assets/ecs-running.png)

The architecture is designed for security and high availability:

- Multi-AZ VPC with public and private subnets
- Internet-facing Application Load Balancer with HTTPS
- ECS Fargate tasks running in private subnets
- Outbound internet access via NAT Gateway
- TLS certificates issued by ACM and DNS-validated via Cloudflare
- Container images stored in private Amazon ECR
- Fully automated CI/CD pipeline with security scanning

## Repository Structure

```
ecs-project
├── Dockerfile
├── README.md
├── app
│   └── main.go
├── assets
│   ├── Docker-image-pushed-to-ECR.png
│   ├── Docker-running.png
│   ├── alb-health-check.png
│   └── live-domain-https.png
├── go.mod
└── infra
    ├── backend.tf
    ├── main.tf
    ├── modules
    │   ├── acm
    │   │   ├── main.tf
    │   │   ├── outputs.tf
    │   │   └── variables.tf
    │   ├── alb
    │   │   ├── main.tf
    │   │   ├── outputs.tf
    │   │   └── variables.tf
    │   ├── ecr
    │   │   ├── main.tf
    │   │   ├── outputs.tf
    │   │   └── variables.tf
    │   ├── ecs
    │   │   ├── main.tf
    │   │   ├── outputs.tf
    │   │   └── variables.tf
    │   ├── iam
    │   │   ├── main.tf
    │   │   ├── outputs.tf
    │   │   └── variables.tf
    │   └── vpc
    │       ├── main.tf
    │       ├── outputs.tf
    │       └── variables.tf
    ├── outputs.tf
    ├── provider.tf
    ├── terraform.tfvars
    └── variables.tf
```

        
