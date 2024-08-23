# modules/vpc/main.tf

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
        range_name    = var.secondary_pods_range_name
        ip_cidr_range = var.secondary_pods_range
      },
      {
        range_name    = var.secondary_services_range_name
        ip_cidr_range = var.secondary_services_range
      }
    ]
  }]
}
