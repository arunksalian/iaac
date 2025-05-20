provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
  resource_group   = var.resource_group
} 