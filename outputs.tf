# outputs.tf

output "vpc_name" {
  description = "The name of the VPC"
  value       = module.vpc.network_name
}

output "subnet_ids" {
  description = "The names of the subnets created"
  value       = [for subnet in module.vpc.subnets : subnet.name]
}

output "gke_cluster_name" {
  description = "The name of the GKE cluster"
  value       = module.gke.cluster_name
}

