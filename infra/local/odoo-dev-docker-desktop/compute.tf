resource "docker_image" "postgres" {
  name         = var.postgres_image
  keep_locally = true
}

resource "docker_image" "odoo" {
  name         = var.odoo_image
  keep_locally = true
}

resource "docker_volume" "postgres_data" {
  name = local.postgres_volume_name
}

resource "docker_volume" "odoo_data" {
  name = local.odoo_volume_name
}

resource "docker_container" "postgres" {
  name    = local.postgres_container_name
  image   = docker_image.postgres.image_id
  restart = "unless-stopped"

  env = [
    "POSTGRES_DB=${var.postgres_db}",
    "POSTGRES_USER=${var.postgres_user}",
    "POSTGRES_PASSWORD=${var.postgres_password}",
  ]

  networks_advanced {
    name    = docker_network.odoo.name
    aliases = ["db"]
  }

  volumes {
    volume_name    = docker_volume.postgres_data.name
    container_path = "/var/lib/postgresql/data"
  }
}

# Напомена за учење: овај Odoo container зависи од Postgres runtime-а
# преко HOST=db и depends_on, а ports блок га износи на localhost.
resource "docker_container" "odoo" {
  name    = local.odoo_container_name
  image   = docker_image.odoo.image_id
  restart = "unless-stopped"

  env = [
    "HOST=db",
    "PORT=5432",
    "USER=${var.postgres_user}",
    "PASSWORD=${var.postgres_password}",
  ]

  networks_advanced {
    name    = docker_network.odoo.name
    aliases = ["odoo"]
  }

  ports {
    internal = 8069
    external = var.odoo_port
  }

  volumes {
    volume_name    = docker_volume.odoo_data.name
    container_path = "/var/lib/odoo"
  }

  volumes {
    host_path      = local.addons_host_path
    container_path = "/mnt/extra-addons"
  }

  depends_on = [docker_container.postgres]
}
