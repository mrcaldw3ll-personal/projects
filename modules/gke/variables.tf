# modules/gke/variables.tf

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "region" {
  description = "The region to deploy the GKE cluster"
  type        = string
}

variable "network_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "subnetwork" {
  description = "The name of the subnetwork"
  type        = string
}

variable "secondary_pods_range_name" {
  description = "The secondary IP range name for pods"
  type        = string
}

variable "secondary_services_range_name" {
  description = "The secondary IP range name for services"
  type        = string
}

variable "node_pools" {
  description = "The node pools configuration"
  type        = list(object({
    name            = string
    machine_type    = string
    min_count       = number
    max_count       = number
    disk_size_gb    = number
    service_account = string
  }))
}
