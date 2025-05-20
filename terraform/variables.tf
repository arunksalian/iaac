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

variable "resource_group" {
  description = "Resource group ID"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment (dev/prod)"
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

variable "db_passwords" {
  description = "Map of database passwords for different environments"
  type = object({
    dev = object({
      admin = string
      app   = string
    })
    prod = object({
      admin = string
      app   = string
    })
  })
  sensitive = true
} 