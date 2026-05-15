output "vm_id" {
  description = "Proxmox VMID"
  value       = proxmox_vm_qemu.this.vmid
}

output "vm_name" {
  description = "VM Display Name in Proxmox"
  value       = proxmox_vm_qemu.this.name
}

output "ipv4_address" {
  description = "IPv4 address"
  value       = proxmox_vm_qemu.this.default_ipv4_address
}

output "mac_address" {
  description = "MAC address of the primary network interface"
  value       = proxmox_vm_qemu.this.network[0].macaddr
}

output "target_node" {
  description = "Node"
  value       = proxmox_vm_qemu.this.target_node
}