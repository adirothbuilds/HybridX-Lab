variable "proxmox_endpoint" {
  description = "Proxmox API endpoint"
  type        = string
}

variable "proxmox_api_token" {
  description = "Proxmox API token"
  type        = string
  sensitive   = true
}

variable "name" {
  type        = string
  description = "Name of the VM"
}

variable "proxmox_node_name" {
  type        = string
  description = "Target Proxmox node"
}

variable "template_id" {
  type        = number
  description = "Template VM ID to clone from"
}

variable "ip_address" {
  type        = string
  description = "IP address with CIDR (e.g. 192.168.1.10/24)"
}

variable "gateway" {
  type        = string
  description = "Gateway address"
}