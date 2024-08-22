# Terraform GKE & VPC Setup

This Terraform project is designed to create a Google Kubernetes Engine (GKE) cluster within a Virtual Private Cloud (VPC) on Google Cloud Platform (GCP). The project includes the creation of a VPC, subnets with secondary IP ranges for pods and services, and a GKE cluster that utilizes these subnets.

## Project Structure

- **`main.tf`**: The primary configuration file where the VPC, subnets, and GKE cluster are defined.
- **`variables.tf`**: Defines input variables for the Terraform project, allowing customization of the infrastructure.
- **`outputs.tf`**: Specifies the outputs that Terraform will provide after the infrastructure is created, such as the VPC name and subnet IDs.
- **`terraform.tfvars`**: Contains the values for the variables defined in `variables.tf`, providing specific configurations for this project.

## Prerequisites

Before you begin, ensure that you have the following:

- [Terraform](https://www.terraform.io/downloads.html) installed.
- A Google Cloud Platform account with the necessary permissions to create VPCs, subnets, and GKE clusters.
- A Google Cloud project where you want to deploy the infrastructure.

## Setup and Usage

### 1. Clone the Repository

```bash
git clone https://github.com/your-repo/terraform-gke-vpc-setup.git
cd terraform-gke-vpc-setup
```

### 2. Initialize Terraform
Run the following command to initialize Terraform. This will download the necessary provider plugins and set up the environment:

```bash
terraform init
```

### 3. Customize terraform.tfvars
Edit the terraform.tfvars file to match your specific environment and requirements. This file contains the values for variables such as the project ID, VPC name, subnet configurations, and GKE cluster name.

```hcl
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
```
