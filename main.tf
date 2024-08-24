# main.tf

locals {
  cluster_subnet_name = "subnet-1"
  pods_range          = "pods-range"
  services_range      = "services-range"
}



# Configure the VPC and Subnets.  Secondary IP ranges for GKE cluster
module "vpc" {
  source = "./modules/vpc"

  project_id = var.project_id
  vpc_name   = "default-vpc"
  subnets = {
    "subnet-1" = {
      name = local.cluster_subnet_name
      ip   = "10.0.0.0/24"
    }
  }

  secondary_pods_range_name     = local.pods_range
  secondary_pods_range          = "10.1.0.0/16"
  secondary_services_range_name = local.services_range
  secondary_services_range      = "10.2.0.0/20"
}

# Configure GKE Cluster
module "gke" {
  source = "./modules/gke"

  project_id                    = var.project_id
  cluster_name                  = "gke-cluster-1"
  region                        = var.region
  network_name                  = module.vpc.network_name
  subnetwork                    = module.vpc.subnets["${var.region}/${local.cluster_subnet_name}"].name
  secondary_pods_range_name     = local.pods_range
  secondary_services_range_name = local.services_range

  node_pools = [{
    name            = "default-pool"
    machine_type    = "e2-medium"
    min_count       = 1
    max_count       = 3
    disk_size_gb    = 100
    service_account = google_service_account.gke_cluster_1_service_account.email
  }]
}
