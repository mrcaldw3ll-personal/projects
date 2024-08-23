# modules/vpc/outputs.tf

output "network_name" {
  description = "The name of the VPC"
  value       = module.vpc.network_name
}

output "subnets" {
  description = "The subnets created"
  value       = module.vpc.subnets
}
