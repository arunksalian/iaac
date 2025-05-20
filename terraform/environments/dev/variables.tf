variable "ibmcloud_api_key" {
  description = "IBM Cloud API Key"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "IBM Cloud region"
  type        = string
  default     = "eu-de"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "suppliq"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
  default = {
    Project     = "SuppliQ"
    Environment = "Development"
    ManagedBy   = "Terraform"
  }
}

variable "db_password" {
  description = "Database admin password"
  type        = string
  sensitive   = true
}

variable "app_db_password" {
  description = "Password for the application database user"
  type        = string
  sensitive   = true
}

variable "db_plan" {
  description = "Database plan"
  type        = string
  default     = "standard"
}

variable "db_memory" {
  description = "Memory allocation in MB"
  type        = number
  default     = 1024
}

variable "db_disk" {
  description = "Disk allocation in MB"
  type        = number
  default     = 20480
}

variable "db_cpu" {
  description = "CPU allocation count"
  type        = number
  default     = 1
} 