# modules/gke/outputs.tf

output "cluster_name" {
  description = "The name of the GKE cluster"
  value       = module.gke.name
}
