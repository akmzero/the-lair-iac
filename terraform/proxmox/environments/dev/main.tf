resource "proxmox_vm_qemu" "ubuntu-base" {

  # Tags
  tags = "ubuntu;tf-managed;role-based"

  # Identity
  name        = "tf-ubuntu-base"
  target_node = "pve"

  # Clone Source
  clone      = "ubuntu-cloud-template"
  full_clone = true

  # Hardware
  sockets = 1
  cores   = 2
  memory  = 2048
  scsihw  = "virtio-scsi-pci"

  # Guest Feats
  agent   = 1
  os_type = "cloud-init"

  # Boot Order
  boot = "order=scsi0"

  # Disks
  disks {
    scsi {
      scsi0 {
        disk {
          size    = "20G"
          storage = "ssdpool"
        }
      }
    }
    ide {
      ide2 {
        cloudinit {
          storage = "ssdpool"
        }
      }
    }
  }

  # Networking
  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr1"
  }

  # Cloud-init
  ipconfig0 = var.ip_config
  cicustom  = "user=local:snippets/ubuntu-baseline.yaml"
}