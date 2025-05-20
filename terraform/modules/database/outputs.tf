output "database_id" {
  description = "ID of the PostgreSQL database instance"
  value       = ibm_resource_instance.postgresql.id
}

output "database_name" {
  description = "Name of the PostgreSQL database instance"
  value       = ibm_resource_instance.postgresql.name
}

output "database_connection_string" {
  description = "Connection string for the PostgreSQL database"
  value       = data.ibm_database_connection.postgresql.postgres[0].composed
  sensitive   = true
}

output "database_hostname" {
  description = "Hostname of the PostgreSQL database"
  value       = data.ibm_database_connection.postgresql.postgres[0].hosts[0].hostname
}

output "database_port" {
  description = "Port of the PostgreSQL database"
  value       = data.ibm_database_connection.postgresql.postgres[0].hosts[0].port
}

output "database_admin_username" {
  description = "Admin username for the PostgreSQL database"
  value       = "admin"
}

output "database_admin_password" {
  description = "Admin password for the PostgreSQL database"
  value       = var.db_password
  sensitive   = true
}

output "setup_instructions" {
  description = "Instructions for setting up the database and application user"
  value       = <<-EOT
    After the database instance is created, you need to:

    1. Connect to the database using the admin credentials
    2. Create a new database named 'suppliq_db'
    3. Create a new user 'suppliq_app' with the password from app_db_password
    4. Grant necessary permissions to the application user

    You can do this using the Cloud Console or the psql command-line tool.
  EOT
} 