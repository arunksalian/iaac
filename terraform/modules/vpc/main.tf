# Create a new VPC
resource "ibm_is_vpc" "vpc" {
  name           = "${var.project_name}-${var.environment}-vpc"
  resource_group = var.resource_group
  tags           = [for k, v in var.tags : "${k}:${v}"]
}

# Create address prefix for the VPC
resource "ibm_is_vpc_address_prefix" "vpc_prefix" {
  name = "${var.project_name}-${var.environment}-prefix"
  vpc  = ibm_is_vpc.vpc.id
  zone = "${var.region}-1"
  cidr = "10.0.0.0/16"
}

# Create subnet
resource "ibm_is_subnet" "subnet" {
  name            = "${var.project_name}-${var.environment}-subnet"
  vpc             = ibm_is_vpc.vpc.id
  zone            = "${var.region}-1"
  ipv4_cidr_block = "10.0.1.0/24"
  resource_group  = var.resource_group
  tags            = [for k, v in var.tags : "${k}:${v}"]
}

# Create security group
resource "ibm_is_security_group" "sg" {
  name           = "${var.project_name}-${var.environment}-sg"
  vpc            = ibm_is_vpc.vpc.id
  resource_group = var.resource_group
  tags           = [for k, v in var.tags : "${k}:${v}"]
}

# Security group rules
resource "ibm_is_security_group_rule" "sg_rule_ssh" {
  group     = ibm_is_security_group.sg.id
  direction = "inbound"
  remote    = var.ssh_source_cidr
  tcp {
    port_min = 22
    port_max = 22
  }
}

resource "ibm_is_security_group_rule" "sg_rule_http" {
  group     = ibm_is_security_group.sg.id
  direction = "inbound"
  remote    = "0.0.0.0/0"
  tcp {
    port_min = 80
    port_max = 80
  }
}

resource "ibm_is_security_group_rule" "sg_rule_https" {
  group     = ibm_is_security_group.sg.id
  direction = "inbound"
  remote    = "0.0.0.0/0"
  tcp {
    port_min = 443
    port_max = 443
  }
} 