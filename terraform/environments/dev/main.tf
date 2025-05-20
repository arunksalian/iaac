provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
}

# Create a new resource group
resource "ibm_resource_group" "group" {
  name = "${var.project_name}-${var.environment}-rg"
  tags = [for k, v in var.tags : "${k}:${v}"]
}

module "vpc" {
  source = "../../modules/vpc"

  project_name    = var.project_name
  environment     = var.environment
  resource_group  = ibm_resource_group.group.id
  region          = var.region
  subnet_cidr     = "10.240.0.0/24"
  ssh_source_cidr = "0.0.0.0/0"  # More permissive for development
  tags            = var.tags
}

module "database" {
  source = "../../modules/database"

  project_name    = var.project_name
  environment     = var.environment
  region          = var.region
  resource_group  = ibm_resource_group.group.id
  tags            = var.tags
  db_password     = var.db_password
  app_db_password = var.app_db_password
  db_plan         = var.db_plan
  db_memory       = var.db_memory
  db_disk         = var.db_disk
  db_cpu          = var.db_cpu
} 