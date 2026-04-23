output "vpc_id" {
  description = "Created VPC ID"
  value       = aws_vpc.kubric.id
}

output "app_subnet_id" {
  description = "Application subnet ID"
  value       = aws_subnet.app.id
}

output "api_gateway_security_group_id" {
  description = "Security group used by API gateway"
  value       = aws_security_group.api_gateway.id
}
