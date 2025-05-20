provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
}

# Create a new resource group
resource "ibm_resource_group" "group" {
  name = "${var.project_name}-${var.environment}-rg"
  tags = var.tags
}

module "vpc" {
  source = "../../modules/vpc"

  project_name    = var.project_name
  environment     = var.environment
  resource_group  = ibm_resource_group.group.name
  region          = var.region
  subnet_cidr     = "10.241.0.0/24"
  ssh_source_cidr = var.office_cidr  # More restrictive for production
  tags            = var.tags
} 