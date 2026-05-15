output "vm_ids" {
  description = "Map of VM keys to Proxmox VMIDs"
  value       = { for k, m in module.ubuntu-dev : k => m.vm_id }
}

output "vm_names" {
  description = "Map of VM keys to display names"
  value       = { for k, m in module.ubuntu-dev : k => m.vm_name }
}

output "vm_ipv4_addresses" {
  description = "Map of VM keys to IPv4 addresses"
  value       = { for k, m in module.ubuntu-dev : k => m.ipv4_address }
}

output "vm_mac_addresses" {
  description = "Map of VM keys to MAC addresses"
  value       = { for k, m in module.ubuntu-dev : k => m.mac_address }
}

output "ansible_connection_strings" {
  description = "Map of VM keys to SSH connection strings"
  value       = { for k, m in module.ubuntu-dev : k => "${var.vm_user}@${m.ipv4_address}" }
}