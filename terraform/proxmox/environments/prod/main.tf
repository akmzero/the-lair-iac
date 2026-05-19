locals {
  vms = {
    "the.yard" = {
      sockets   = 2
      cores     = 20
      memory    = 81920
      disk_size = "150G"
      pci_devices = [
        { id = 0, raw_id = "0000:03:00.0", pcie = true, rombar = true, primary_gpu = true },  # RTX3080
        { id = 1, raw_id = "0000:06:00.0", pcie = true, rombar = true, primary_gpu = false }, # Tuner 1
        { id = 2, raw_id = "0000:07:00.0", pcie = true, rombar = true, primary_gpu = false }, # Tuner 2
      ]
    }
  }
}

module "ubuntu-prod" {
  source   = "../../modules/ubuntu-server"
  for_each = local.vms

  name        = "tf-ubuntu-${each.key}"
  target_node = "pve"
  sockets     = each.value.sockets
  cores       = each.value.cores
  memory      = each.value.memory
  disk_size   = each.value.disk_size
  tags        = "ubuntu;tf-managed;prod"
  pci_devices = each.value.pci_devices
}