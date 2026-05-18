locals {
  vms = {
    "web" = { cores = 1, memory = 2048, disk_size = "20G" }
    "db" = { cores = 4, memory = 4096, disk_size = "25G" }
  }
}

module "ubuntu-dev" {
  source   = "../../modules/ubuntu-server"
  for_each = local.vms

  name        = "tf-ubuntu-${each.key}"
  target_node = "pve"
  cores       = each.value.cores
  memory      = each.value.memory
  disk_size   = each.value.disk_size
  tags        = "ubuntu;tf-managed;dev"
}