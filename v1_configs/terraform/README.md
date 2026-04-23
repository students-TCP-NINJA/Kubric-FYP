# Terraform Starter (Kubric FYP)

This folder contains baseline Terraform files for provisioning a minimal cloud network and compute foundation for Kubric.

## Files

- `main.tf`: provider and module wiring
- `variables.tf`: configurable input values
- `outputs.tf`: key output values

## Usage

```bash
terraform init
terraform plan -var="project_name=kubric-fyp" -var="region=us-east-1"
terraform apply -var="project_name=kubric-fyp" -var="region=us-east-1"
```

Adjust for your target provider and naming policy.
