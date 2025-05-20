variable "ibmcloud_api_key" {
  description = "IBM Cloud API Key"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "IBM Cloud region"
  type        = string
  default     = "us-south"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "suppliq"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "prod"
}

variable "tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
  default = {
    Project     = "SuppliQ"
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}

variable "office_cidr" {
  description = "Office IP range for SSH access"
  type        = string
  default     = "192.168.1.0/24"
} 