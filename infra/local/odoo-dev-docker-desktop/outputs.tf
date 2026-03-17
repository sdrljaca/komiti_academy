output "odoo_url" {
  value       = "http://localhost:${var.odoo_port}"
  description = "Local Odoo URL."
}

output "postgres_container_name" {
  value       = docker_container.postgres.name
  description = "Local Postgres container name."
}

output "odoo_container_name" {
  value       = docker_container.odoo.name
  description = "Local Odoo container name."
}

output "docker_network_name" {
  value       = docker_network.odoo.name
  description = "Local Docker network name."
}

output "addons_host_path" {
  value       = local.addons_host_path
  description = "Host path mounted into /mnt/extra-addons for local module development."
}
