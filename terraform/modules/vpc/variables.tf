variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "resource_group" {
  description = "Resource group ID"
  type        = string
}

variable "region" {
  description = "IBM Cloud region"
  type        = string
}

variable "ssh_source_cidr" {
  description = "CIDR block for SSH access"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
} 