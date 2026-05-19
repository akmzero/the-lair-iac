variable "name" {
  type        = string
  description = "Display name of the VM"
}

variable "target_node" {
  type        = string
  description = "Cluster node to create the VM on"
}

variable "cores" {
  type        = number
  description = "Number of CPU cores to allocate"
  default     = 2
}

variable "memory" {
  type        = number
  description = "RAM in MB"
  default     = 2048
}

variable "disk_size" {
  type        = string
  description = "OS disk size"
  default     = "20G"
}

variable "tags" {
  type        = string
  description = "Tags for inventory and identification"
  default     = "ubuntu;tf-managed"
}

variable "storage" {
  type        = string
  description = "Storage Pool for VM disks and cloud-init drive"
  default     = "ssdpool"
}

variable "ip_config" {
  type        = string
  description = "Cloud-init IP config ('ip=dhcp' or 'ip=10.5.0.50/24,gw=10.5.0.1')"
  default     = "ip=dhcp"
}

variable "vlan_tag" {
  type        = number
  description = "VLAN ID for the network interface. Null = untagged."
  default     = null
}

variable "sockets" {
  type        = number
  description = "Number of CPU sockets"
  default     = 1
}

variable "pci_devices" {
  type = list(object({
    id          = number
    raw_id      = string
    pcie        = optional(bool, true)
    rombar      = optional(bool, true)
    primary_gpu = optional(bool, false)
  }))
  description = "PCI devices to pass through. Slot id is explicit (0-15)."
  default     = []
}

