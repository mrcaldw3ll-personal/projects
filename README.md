# Terraform GKE & VPC Setup

This Terraform project is designed to create a Google Kubernetes Engine (GKE) cluster within a Virtual Private Cloud (VPC) on Google Cloud Platform (GCP). The project includes the creation of a VPC, subnets with secondary IP ranges for pods and services, and a GKE cluster that utilizes these subnets.

## Project Structure

- **`main.tf`**: The primary configuration file where the VPC, subnets, and GKE cluster are defined.
- **`variables.tf`**: Defines input variables for the Terraform project, allowing customization of the infrastructure.
- **`outputs.tf`**: Specifies the outputs that Terraform will provide after the infrastructure is created, such as the VPC name and subnet IDs.
- **`terraform.tfvars`**: Contains the values for the variables defined in `variables.tf`, providing specific configurations for this project.
- **`modules`**: Folder contains reusable components built from basic resource definitions or abstractions of third-party modules

## Prerequisites

Before you begin, ensure that you have the following:

- [Terraform](https://www.terraform.io/downloads.html) installed.
- A Google Cloud project where you want to deploy the infrastructure.
- A Google Cloud Platform Terraform service account with the necessary permissions to create VPCs, subnets, and GKE clusters.
- A JSON key file for Terraform GCP account configured locally or configured in Terraform Enterprise Workspace

```bash
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/your-service-account-file.json"
```

## Setup and Usage

### 1. Clone the Repository

```bash
git clone https://github.com/mrcaldw3ll-personal/terraform-gke-project.git
cd terraform-gke-project
```

### 2. Initialize Terraform
Run the following command to initialize Terraform. This will download the necessary provider plugins and set up the environment:

```bash
terraform init
```

### 3. Customize terraform.tfvars
Edit the terraform.tfvars file to match your specific environment and requirements. This file contains the values for variables such as the project ID, VPC name, subnet configurations, and GKE cluster name.

```hcl
project_id        = "temp-862g6l3f-xxxx"
region            = "us-central1"
```

### 4. Apply the Terraform Configuration
Run the following command to create the infrastructure:

```bash
terraform apply
```

### 5. Review the Outputs
Once the infrastructure is created, Terraform will output relevant information such as the VPC name, subnet IDs, and GKE cluster name. These outputs are defined in the outputs.tf file.

### Cleanup

```bash
terraform destroy
```
