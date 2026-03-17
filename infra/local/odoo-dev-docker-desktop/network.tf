# Напомена за учење: локални lab прво поставља shared Docker network foundation,
# а не само Odoo container. На ову мрежу се касније каче и Postgres и Odoo runtime.
resource "docker_network" "odoo" {
  name = local.network_name
}
