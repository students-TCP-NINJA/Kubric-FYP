variable "project_name" {
  description = "Project name prefix for resources"
  type        = string
  default     = "kubric-fyp"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "prod"
}

variable "region" {
  description = "Cloud region"
  type        = string
  default     = "us-east-1"
}

variable "availability_zone" {
  description = "Primary AZ"
  type        = string
  default     = "us-east-1a"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "10.20.0.0/16"
}

variable "app_subnet_cidr" {
  description = "Application subnet CIDR"
  type        = string
  default     = "10.20.1.0/24"
}
