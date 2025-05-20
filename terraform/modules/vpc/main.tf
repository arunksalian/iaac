# Create a VPC
resource "ibm_is_vpc" "vpc" {
  name           = "${var.project_name}-${var.environment}-vpc"
  resource_group = var.resource_group
  tags           = [for k, v in var.tags : "${k}:${v}"]
}

# Create a subnet
resource "ibm_is_subnet" "subnet" {
  name           = "${var.project_name}-${var.environment}-subnet"
  vpc            = ibm_is_vpc.vpc.id
  zone           = "${var.region}-1"
  ipv4_cidr_block = var.subnet_cidr
  resource_group = var.resource_group
  tags           = [for k, v in var.tags : "${k}:${v}"]
}

# Create a security group
resource "ibm_is_security_group" "sg" {
  name           = "${var.project_name}-${var.environment}-sg"
  vpc            = ibm_is_vpc.vpc.id
  resource_group = var.resource_group
  tags           = [for k, v in var.tags : "${k}:${v}"]
}

# Add security group rule for SSH
resource "ibm_is_security_group_rule" "sg_rule_ssh" {
  group     = ibm_is_security_group.sg.id
  direction = "inbound"
  remote    = var.ssh_source_cidr
  tcp {
    port_min = 22
    port_max = 22
  }
}

# Add security group rule for HTTP
resource "ibm_is_security_group_rule" "sg_rule_http" {
  group     = ibm_is_security_group.sg.id
  direction = "inbound"
  remote    = "0.0.0.0/0"
  tcp {
    port_min = 80
    port_max = 80
  }
}

# Add security group rule for HTTPS
resource "ibm_is_security_group_rule" "sg_rule_https" {
  group     = ibm_is_security_group.sg.id
  direction = "inbound"
  remote    = "0.0.0.0/0"
  tcp {
    port_min = 443
    port_max = 443
  }
} 