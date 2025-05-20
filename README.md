# SuppliQ Infrastructure as Code (IaC)

## Overview
This repository contains the Infrastructure as Code (IaC) project for SuppliQ, focusing on automating infrastructure deployment and management on Cloud. The project uses Terraform to manage cloud resources including VPCs, subnets, security groups, and PostgreSQL databases.

## Project Structure
```
.
├── terraform/
│   ├── environments/
│   │   ├── dev/          # Development environment configurations
│   │   └── prod/         # Production environment configurations
│   └── modules/
│       ├── vpc/          # VPC module
│       └── database/     # Database module
└── README.md
```

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) (v1.0.0 or later)
- [Cloud CLI](https://cloud.ibm.com/docs/cli?topic=cli-getting-started)
- Cloud account with appropriate permissions
- Cloud API key

## Getting Started

### 1. Clone the Repository
```bash
git clone [repository-url]
cd iaac
```

### 2. Configure Cloud
1. Install the Cloud CLI
2. Log in to Cloud:
   ```bash
   ibmcloud login
   ```
3. Generate an API key from the Cloud Console:
   - Go to Manage > Access (IAM) > API keys
   - Create an API key
   - Save the API key securely

### 3. Initialize Terraform
```bash
cd terraform/environments/dev
terraform init
```

### 4. Deploy Infrastructure
1. Set required variables:
   ```bash
   # Set your Cloud API key
   $env:TF_VAR_ibmcloud_api_key="your-api-key"
   
   # Set database passwords
   $env:TF_VAR_db_password="your-admin-password"
   ```

2. Plan the deployment:
   ```bash
   terraform plan
   ```

3. Apply the configuration:
   ```bash
   terraform apply
   ```

## Database Setup

### Getting Database Connection Information
After deploying the infrastructure, you can get the database connection information using:

```bash
# Get the full connection string
terraform output database_connection_string

# Get individual connection details
terraform output database_hostname
terraform output database_port
terraform output database_admin_username
```

### Manual Database Setup
After the database instance is created, you need to:

1. Connect to the database using the admin credentials
2. Create a new database named 'suppliq_db'
3. Create a new user 'suppliq_app' with appropriate permissions
4. Grant necessary permissions to the application user

You can do this using:
- Cloud Console
- psql command-line tool
- Cloud CLI

## Environment-Specific Configurations

### Development Environment
- Located in `terraform/environments/dev/`
- Uses more permissive security settings
- Includes development-specific resource configurations

### Production Environment
- Located in `terraform/environments/prod/`
- Implements stricter security measures
- Includes production-specific resource configurations

## Security Considerations
- All sensitive variables are marked as `sensitive = true`
- Database passwords should be managed securely
- API keys should be stored securely and never committed to version control
- Use environment variables or secure secret management for sensitive values

## Contributing
1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License
[Add license information here]

## Contact
[Add contact information here] 