terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.84.1"
    }
  }
}

resource "proxmox_virtual_environment_vm" "this" {
    name        = var.name
    node_name   = var.proxmox_node_name

    clone {
        vm_id = var.template_id
        full  = true
    }

    agent {
        enabled = var.enabled_agent
    }

    cpu {
        cores   = var.cores
        sockets = var.sockets
    }

    memory {
        dedicated = var.memory
    }

    network_device {
        bridge = var.network_bridge
        model  = var.network_model
    }

    disk {
        datastore_id = var.datastore
        size         = var.disk_size
        interface    = "scsi0"
        iothread     = true
        discard      = "on"
    }

    initialization {
        datastore_id = var.datastore
        ip_config {
        ipv4 {
            address = var.ip_address
            gateway = var.gateway
        }
        }
        user_account {
            username = var.username
            keys     = [file(var.ssh_key)]
        }
    }
}