locals {
  project_name_normalized = replace(var.project_name, "_", "-")
  name_prefix             = "${local.project_name_normalized}-${var.env}"

  network_name            = "${local.name_prefix}-network"
  postgres_container_name = "${local.name_prefix}-postgres"
  odoo_container_name     = "${local.name_prefix}-odoo"
  postgres_volume_name    = "${local.name_prefix}-postgres-data"
  odoo_volume_name        = "${local.name_prefix}-odoo-data"

  addons_host_path = abspath("${path.module}/../../../custom-addons")
}
