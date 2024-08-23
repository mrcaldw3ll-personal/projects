# main.tf

locals {
  pods-range = "pods-range"
  services-range = "services-range"
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# VPC creation using Terraform Registry module
# https://registry.terraform.io/modules/terraform-google-modules/network/google/latest
module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 9.0"

  project_id   = var.project_id
  network_name = var.vpc_name
  subnets      = [for subnet in var.subnets : {
    subnet_name   = subnet.name
    subnet_ip     = subnet.ip
    subnet_region = var.region
    secondary_ip_range = [
      {
        range_name    = local.pods-range
        ip_cidr_range = var.secondary_pods_range
      },
      {
        range_name    = local.services-range
        ip_cidr_range = var.secondary_services_range
      }
    ]
  }]
}

# Create Service Accounts
resource "google_service_account" "service_accounts" {
  for_each = var.service_accounts

  account_id   = each.value.name
  display_name = each.value.display_name
}

# GKE Cluster using Terraform Registry module
# https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/latest
module "gke" {
  source            = "terraform-google-modules/kubernetes-engine/google"
  version           = "~> 28.0"
  
  project_id        = var.project_id
  name              = var.cluster_name
  region            = var.region
  network           = module.vpc.network_name
  subnetwork        = module.vpc.subnets["${var.region}/${var.cluster_subnet_name}"].name
  ip_range_pods     = local.pods-range
  ip_range_services = local.services-range

  # Service Account
  node_pools = [{
    name               = "default-pool"
    machine_type       = "e2-medium"
    min_count          = 1
    max_count          = 3
    disk_size_gb       = 100
    service_account    = google_service_account.service_accounts["${var.cluster_name}"].email
  }]
}
