resource "proxmox_vm_qemu" "this" {

  # Identity
  name        = var.name
  target_node = var.target_node
  tags        = var.tags

  # Clone source
  clone      = "ubuntu-cloud-template"
  full_clone = true

  # Hardware
  cores   = var.cores
  memory  = var.memory
  sockets = var.sockets
  scsihw  = "virtio-scsi-pci"
  
  # PCI passthrough
  dynamic "pci" {
    for_each = var.pci_devices
    content {
      id          = pci.value.id
      raw_id      = pci.value.raw_id
      pcie        = pci.value.pcie
      rombar      = pci.value.rombar
      primary_gpu = pci.value.primary_gpu
    }
  }

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
          size    = var.disk_size
          storage = var.storage
        }
      }
    }
    ide {
      ide2 {
        cloudinit {
          storage = var.storage
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
  cicustom  = "user=local:snippets/ubuntu-baseline.yaml"
  ipconfig0 = var.ip_config
}