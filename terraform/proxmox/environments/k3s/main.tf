module "cluster_vms" {
    source              = "../../modules/vm"
    for_each            = var.machines

    name                = each.key
    proxmox_node_name   = var.proxmox_node_name
    template_id         = var.template_id
    enabled_agent       = var.agent_enabled

    ip_address        = each.value.ip_address
    gateway           = each.value.gateway
    cores             = each.value.cores
    sockets           = each.value.sockets
    memory            = each.value.memory
    username          = each.value.username
    ssh_key           = each.value.ssh_key
    network_bridge    = each.value.network_bridge
    network_model     = each.value.network_model
    datastore         = each.value.datastore
    disk_size         = each.value.disk_size

    providers = {
        proxmox = proxmox
    }
}