variable "proxmox_api_url" {
  type        = string
  description = "The URL of the Proxmox API endpoint, e.g. https://10.5.0.5:8006/api2/json"
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