variable "name" {
    description = "VM's name"
    type        = string
}

variable "proxmox_node_name" {
    description = "Proxmox server's name"
    type        = string
}

variable "template_id" {
    description = "VM's template ID at proxmox's server"
    type        = string
}

variable "enabled_agent" {
    description = "Enable QEMU Agent to check the VM via applyment"
    type        = bool
    default     = false
}

variable "cores" {
    description = "How much cores for the VM"
    type        = number
    default     = 2
}

variable "sockets" {
    description = "How much sockets for the VM"
    type        = number
    default     = 1
}

variable "memory" {
    description = "How much memory for the VM"
    type        = number
    default     = 2048
}

variable "network_bridge" {
    description = "Network bridge"
    type        = string
    default     = "vmbr0"
}

variable "network_model" {
    description = "Network model"
    type        = string
    default     = "virtio"
}

variable "datastore" {
    description = "Datastore at proxmox server to use for storage"
    type        = string
    default     = "local-lvm"
}

variable "ip_address" {
    description = "Static IP for VM"
    type        = string
}

variable "gateway" {
    description = "VM Gateway"
    type        = string
}

variable "username" {
    description = "VM username"
    type        = string
    default     = "ubuntu"
}

variable "ssh_key" {
    description = "VM user's ssh key"
    type        = string
    default = "~/.ssh/id_ed25519.pub"
}