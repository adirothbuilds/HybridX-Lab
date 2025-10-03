module "ubuntu_vm_example" {
    source              = "./modules/vm"
    name                = var.name
    proxmox_node_name   = var.proxmox_node_name
    template_id         = var.template_id
    ip_address          = var.ip_address
    gateway             = var.gateway

    providers = {
        proxmox = proxmox
    }
}