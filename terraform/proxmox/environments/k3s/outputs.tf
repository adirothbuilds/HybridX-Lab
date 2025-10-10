output "vm_ips" {
  value = { for name, vm in module.cluster_vms : name => vm.vm_ip_address }
}

output "ssh_commands" {
  value = { for name, vm in module.cluster_vms : name => vm.ssh_command }
}