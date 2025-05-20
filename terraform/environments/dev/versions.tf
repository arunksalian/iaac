terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "1.45.0"  # Using an older version that supports 32-bit Windows
    }
  }
  required_version = ">= 1.0.0"
} 