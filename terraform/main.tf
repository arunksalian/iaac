# Get the resource group
data "ibm_resource_group" "group" {
  name = var.resource_group
}

# Create a VPC
resource "ibm_is_vpc" "vpc" {
  name           = "${var.project_name}-vpc"
  resource_group = data.ibm_resource_group.group.id
}

# Create a subnet
resource "ibm_is_subnet" "subnet" {
  name           = "${var.project_name}-subnet"
  vpc            = ibm_is_vpc.vpc.id
  zone           = "${var.region}-1"
  ipv4_cidr_block = "10.240.0.0/24"
  resource_group = data.ibm_resource_group.group.id
}

# Create a security group
resource "ibm_is_security_group" "sg" {
  name           = "${var.project_name}-sg"
  vpc            = ibm_is_vpc.vpc.id
  resource_group = data.ibm_resource_group.group.id
}

# Add security group rule for SSH
resource "ibm_is_security_group_rule" "sg_rule_ssh" {
  group     = ibm_is_security_group.sg.id
  direction = "inbound"
  remote    = "0.0.0.0/0"
  tcp {
    port_min = 22
    port_max = 22
  }
}

module "database" {
  source = "./modules/database"

  project_name     = var.project_name
  environment      = var.environment
  region          = var.region
  resource_group  = var.resource_group
  tags            = var.tags
  db_plan         = var.db_plan
  db_memory       = var.db_memory
  db_disk         = var.db_disk
  db_cpu          = var.db_cpu
  db_password     = var.db_passwords[var.environment].admin
  app_db_password = var.db_passwords[var.environment].app
} 