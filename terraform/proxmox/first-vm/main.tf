resource "proxmox_vm_qemu" "ubuntu-base" {
  name        = "tf-ubuntu-base"
  target_node = "pve"
  clone       = "ubuntu-cloud-template"
  full_clone  = true

  cores   = 2
  memory  = 2048

  agent = 1

  os_type = "cloud-init"

  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr1"
  }
}