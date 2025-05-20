variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment (dev/prod)"
  type        = string
}

variable "region" {
  description = "IBM Cloud region"
  type        = string
  default     = "us-south"
}

variable "resource_group" {
  description = "Resource group ID"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "db_plan" {
  description = "Database plan"
  type        = string
  default     = "enterprise"
}

variable "db_memory" {
  description = "Memory allocation in MB"
  type        = number
  default     = 4096
}

variable "db_disk" {
  description = "Disk allocation in MB"
  type        = number
  default     = 102400
}

variable "db_cpu" {
  description = "CPU allocation count"
  type        = number
  default     = 2
}

variable "db_password" {
  description = "Admin password for the database"
  type        = string
  sensitive   = true
}

variable "app_db_password" {
  description = "Password for the application database user"
  type        = string
  sensitive   = true
} 