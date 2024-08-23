# modules/vpc/variables.tf

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

variable "secondary_pods_range_name" {
  description = "The secondary IP range name for pods"
  type        = string
}

variable "secondary_pods_range" {
  description = "The secondary IP range for pods"
  type        = string
}

variable "secondary_services_range_name" {
  description = "The secondary IP range name for services"
  type        = string
}

variable "secondary_services_range" {
  description = "The secondary IP range for services"
  type        = string
}