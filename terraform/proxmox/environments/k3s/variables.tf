variable "proxmox_endpoint" {
  description = "Proxmox API endpoint"
  type        = string
}

variable "proxmox_api_token" {
  description = "Proxmox API token"
  type        = string
  sensitive   = true
}

variable "proxmox_node_name" {
  type        = string
  description = "Target Proxmox node"
}

variable "template_id" {
  type        = number
  description = "Template VM ID to clone from"
}

variable "agent_enabled" {
  description = "Enable QEMU Guest Agent"
  type        = bool
  default     = true
}

variable "machines" {
  description = "Machine definitions for the cluster"
  type = map(object({
    ip_address      = string
    gateway         = string
    cores           = number
    sockets         = number
    memory          = number
    username        = string
    ssh_key         = string
    network_bridge  = string
    network_model   = string
    datastore       = string
    disk_size       = number
  }))
}