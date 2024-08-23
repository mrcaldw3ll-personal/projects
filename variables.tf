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
