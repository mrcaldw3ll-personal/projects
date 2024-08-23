# variables.tf

variable "project_id" {
  description = "The project ID to deploy the infrastructure"
  type        = string
}

variable "region" {
  description = "The region to deploy the infrastructure"
  type        = string
  default     = "us-central1"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "subnets" {
  description = "A list of subnets to create in the VPC"
  type = map(object({
    name = string
    ip   = string
  }))
}

variable "service_accounts" {
  description = "A map of service accounts to create"
  type = map(object({
    name         = string
    display_name = string
  }))
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "cluster_subnet_name" {
  description = "The subnet created for the GKE cluster "
  type        = string
}

variable "secondary_pods_range" {
  description = "The secondary IP range for pods"
  type        = string
}

variable "secondary_services_range" {
  description = "The secondary IP range for services"
  type        = string
}