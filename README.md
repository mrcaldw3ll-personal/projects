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
git clone https://github.com/your-repo/terraform-gke-project.git
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
project_id        = "temp-862g6l3f-wsky"
region            = "us-central1"
```

### 4. Apply the Terraform Configuration
Run the following command to create the infrastructure:

```bash
terraform apply
```

### 5. Review the Outputs
Once the infrastructure is created, Terraform will output relevant information such as the VPC name, subnet IDs, and GKE cluster name. These outputs are defined in the outputs.tf file.

### File Descriptions
main.tf
This file contains the main Terraform configuration, which includes:

Creation of the VPC using the Terraform Google Modules.
Configuration of subnets with secondary IP ranges for pods and services.
Deployment of the GKE cluster, referencing the subnets created.
variables.tf
This file defines all the input variables used in the main.tf file, including:

project_id: The ID of your GCP project.
region: The region where the infrastructure will be deployed.
vpc_name: The name of the VPC to be created.
subnets: A map defining the subnets, their IP ranges, and secondary IP ranges.
subnet_for_gke: The name of the subnet to be used for the GKE cluster.
cluster_name: The name of the GKE cluster.
outputs.tf
This file defines the outputs of the Terraform run, such as:

The name of the VPC created.
The IDs of the subnets created.
The name of the GKE cluster.
terraform.tfvars
This file contains the actual values for the variables defined in variables.tf. It allows you to customize the deployment according to your specific requirements.

### Cleanup

```bash
terraform destroy
```
