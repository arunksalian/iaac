# Create a PostgreSQL database instance
resource "ibm_resource_instance" "postgresql" {
  name              = "${var.project_name}-${var.environment}-db"
  service           = "databases-for-postgresql"
  plan              = "standard"
  location          = var.region
  resource_group_id = var.resource_group
  tags              = [for k, v in var.tags : "${k}:${v}"]

  parameters = {
    "admin_password"     = var.db_password
    "service_endpoints"  = "public"
  }
}

# Get database connection information
data "ibm_database_connection" "postgresql" {
  deployment_id = ibm_resource_instance.postgresql.id
  user_id       = "admin"
  user_type     = "database"
  endpoint_type = "public"
}

# Note: Database and user creation will need to be handled through the Cloud Console
# or using the Cloud CLI after the database instance is created.
# The following resources are not supported by the provider:
# - ibm_database_database
# - ibm_database_user
# - ibm_database_user_permissions 