# SuppliQ Infrastructure

This repository contains the Terraform configuration for the SuppliQ project's infrastructure on IBM Cloud.

## Prerequisites

- Terraform v1.0.0 or later
- IBM Cloud CLI
- IBM Cloud account with appropriate permissions

## Setup Instructions

1. **Install Required Tools**
   ```bash
   # Install IBM Cloud CLI
   curl -fsSL https://clis.cloud.ibm.com/install/linux | sh
   
   # Install Terraform
   # Follow instructions at https://www.terraform.io/downloads.html
   ```

2. **Configure IBM Cloud API Key**

   There are two ways to set up your IBM Cloud API key:

   **Option 1: Environment Variable (Recommended)**
   ```bash
   # For Linux/Mac
   export IBMCLOUD_API_KEY="your-api-key"

   # For Windows PowerShell
   $env:IBMCLOUD_API_KEY="your-api-key"

   # For Windows Command Prompt
   set IBMCLOUD_API_KEY=your-api-key
   ```

   **Option 2: Terraform Variables File**
   - Copy `terraform.tfvars.example` to `terraform.tfvars`
   - Add your API key to `terraform.tfvars`
   - Note: This method is less secure and not recommended for production

3. **Login to IBM Cloud**
   ```bash
   # Login to IBM Cloud
   ibmcloud login
   ```

4. **Initialize Terraform**
   ```bash
   cd terraform/environments/dev
   terraform init
   ```

5. **Configure Variables**
   - Copy `terraform.tfvars.example` to `terraform.tfvars`
   - Update the values in `terraform.tfvars` with your specific configuration
   - Never commit `terraform.tfvars` to version control
   - Note: The API key should be set via environment variable, not in this file

6. **Apply Configuration**
   ```bash
   terraform plan
   terraform apply
   ```

## Security Notes

- Never commit sensitive information like API keys or passwords
- Use environment variables or a secrets manager for sensitive data
- Regularly rotate API keys and passwords
- Follow the principle of least privilege when assigning permissions
- For production environments, use a secrets management solution like IBM Cloud Secrets Manager

## Project Structure

```
terraform/
├── environments/
│   ├── dev/          # Development environment
│   └── prod/         # Production environment
└── modules/
    ├── database/     # Database module
    └── vpc/          # VPC module
```

## Contributing

1. Create a new branch for your changes
2. Make your changes
3. Submit a pull request
4. Ensure all sensitive information is properly handled

## License

[Add your license information here] 