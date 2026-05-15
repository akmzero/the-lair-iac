variable "proxmox_api_url" {
  type        = string
  description = "Proxmox API Endpoint"
}

variable "proxmox_api_token_id" {
  type        = string
  description = "Proxmox API token ID (user@realm!tokenname)"
}

variable "proxmox_api_token_secret" {
  type        = string
  description = "Proxmox API token secret"
  sensitive   = true
}

variable "vm_user" {
  type        = string
  description = "SSH user configured in the cloud-init snippet"
  default     = "ansible"
}