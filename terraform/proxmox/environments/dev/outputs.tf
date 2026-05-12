output "vm_id" {
  description = "Proxmox VMID"
  value       = proxmox_vm_qemu.ubuntu-base.vmid
}

output "vm_name" {
  description = "VM display name"
  value       = proxmox_vm_qemu.ubuntu-base.name
}

output "vm_ipv4_address" {
  description = "IPv4 address assigned to the VM"
  value       = proxmox_vm_qemu.ubuntu-base.default_ipv4_address
}

output "vm_mac_address" {
  description = "MAC address of the VM's first network interface — useful for DHCP reservations"
  value       = proxmox_vm_qemu.ubuntu-base.network[0].macaddr
}

output "ssh_user" {
  description = "Username configured via cloud-init"
  value       = var.vm_user
}

output "ansible_connection_string" {
  description = "SSH connection string"
  value       = "${var.vm_user}@${proxmox_vm_qemu.ubuntu-base.default_ipv4_address}"
}