# Proxmox VM Module

Reusable Terraform module that clones an existing Proxmox template and prepares the virtual machine with networking, SSH access, and basic hardware settings. Designed to be called from higher-level configurations such as `terraform/proxmox`.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `name` | VM's name | `string` | n/a | yes |
| `proxmox_node_name` | Proxmox server's name | `string` | n/a | yes |
| `template_id` | VM template ID at Proxmox | `string` | n/a | yes |
| `enabled_agent` | Enable QEMU agent | `bool` | `false` | no |
| `cores` | Number of CPU cores | `number` | `2` | no |
| `sockets` | Number of CPU sockets | `number` | `1` | no |
| `memory` | RAM in MiB | `number` | `2048` | no |
| `network_bridge` | Network bridge name | `string` | `vmbr0` | no |
| `network_model` | Network device model | `string` | `virtio` | no |
| `datastore` | Storage datastore | `string` | `local-lvm` | no |
| `ip_address` | Static IP with CIDR | `string` | n/a | yes |
| `gateway` | Default gateway | `string` | n/a | yes |
| `username` | Guest username | `string` | `ubuntu` | no |
| `ssh_key` | Path to public SSH key | `string` | `~/.ssh/id_ed25519.pub` | no |

## Outputs

| Name | Description |
|------|-------------|
| `vm_id` | Assigned Proxmox VM ID |
| `vm_name` | Name of the created VM |
| `vm_ip_address` | Configured IPv4 address |
| `ssh_command` | Ready-to-run SSH command for the VM |

## Example Usage

```hcl
module "ubuntu_vm" {
  source            = "./modules/vm"
  name              = "lab-ubuntu"
  proxmox_node_name = "pve01"
  template_id       = "100"
  ip_address        = "192.168.10.20/24"
  gateway           = "192.168.10.1"
  ssh_key           = "./id_rsa.pub"

  providers = {
    proxmox = proxmox
  }
}
```

See the root configuration in `terraform/proxmox` for a full working example and provider setup.
