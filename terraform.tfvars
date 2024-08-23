# terraform.tfvars

project_id        = "temp-862g6l3f-wsky"
region            = "us-central1"
vpc_name          = "default-vpc"

subnets = {
  "subnet-1" = {
    name = "subnet-1"
    ip   = "10.0.0.0/24"
  }
}

service_accounts = {
  "gke-cluster-1" = {
    name         = "sa-gke-cluster-1"
    display_name = "Default Service Account"
  }
}

cluster_name      = "gke-cluster-1"
cluster_subnet_name = "subnet-1"
secondary_pods_range     = "10.1.0.0/16"
secondary_services_range = "10.2.0.0/20"
