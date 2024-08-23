# iam.tf
# This file will create the required service accounts and iam permissions for the project

locals {
  gke_roles = [
    "container.admin",
    "compute.viewer",
    "iam.serviceAccountUser"
  ]
}

# Create service account for gke cluster 1
resource "google_service_account" "gke_cluster_1_service_account" {
  account_id   = "gke-cluster-1-sa"
  display_name = "GKE Cluster 1 Service Account"
}

# Assign roles to gke cluster 1 service account
resource "google_project_iam_member" "gke_sa_roles" {
  for_each = toset(local.gke_roles)

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.gke_cluster_1_service_account.email}"
}
