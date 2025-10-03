output "vm_id" {
  description = "The Proxmox VM ID"
  value       = proxmox_virtual_environment_vm.this.vm_id
}

output "vm_name" {
  description = "The Proxmox VM Name"
  value = proxmox_virtual_environment_vm.this.name
}

output "vm_ip_address" {
  description = "The IP address assigned to the VM"
  value = proxmox_virtual_environment_vm.this.initialization[0].ip_config[0].ipv4[0].address
}

output "ssh_command" {
  description = "Ready-to-use SSH command"
  value       = "ssh ${proxmox_virtual_environment_vm.this.initialization[0].user_account[0].username}@${split("/", proxmox_virtual_environment_vm.this.initialization[0].ip_config[0].ipv4[0].address)[0]}"
}