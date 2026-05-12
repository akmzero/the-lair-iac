variable "proxmox_api_url" {
  type        = string
  description = "The URL of the Proxmox API endpoint"
}

variable "proxmox_api_token_id" {
  type        = string
  description = "The Proxmox API token ID, in the format user@realm!tokenname"
}

variable "proxmox_api_token_secret" {
  type        = string
  description = "The Proxmox API token secret (UUID format)"
  sensitive   = true
}

variable "vm_user" {
  type        = string
  description = "Initial admin user created by cloud-init; used by Ansible for subsequent configuration"
  default     = "ansible"
}

variable "vm_password" {
  type        = string
  description = "VM Password"
  sensitive   = true
  default     = ""
}

variable "ssh_public_key" {
  type        = string
  description = "VM Public SSH Key"
}

variable "ip_config" {
  type        = string
  description = "VM Network Type"
  default     = "ip=dhcp"
}