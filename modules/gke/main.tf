# modules/gke/main.terraform 

# GKE Cluster using Terraform Registry module
# https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/latest
module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google"
  version = "~> 28.0"

  project_id        = var.project_id
  name              = var.cluster_name
  region            = var.region
  network           = var.network_name
  subnetwork        = var.subnetwork
  ip_range_pods     = var.secondary_pods_range_name
  ip_range_services = var.secondary_services_range_name

  node_pools = var.node_pools
}
