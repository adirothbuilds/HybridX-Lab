locals {
  master_ips = [
    for name, vm in module.cluster_vms :
    vm.vm_ip_address if length(regexall("master", name)) > 0
  ]

  worker_ips = [
    for name, vm in module.cluster_vms :
    vm.vm_ip_address if length(regexall("master", name)) == 0
  ]

  all_host_data = {
    for name, machine in var.machines :
    split("/", machine.ip_address)[0] => {
      ssh_key  = machine.ssh_key
      username = machine.username
    }
  }
}

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/ansible_inventory.tpl", {
    master_ip  = one(local.master_ips)
    worker_ips = local.worker_ips
  })
  filename = "${path.module}/inventory.ini"
}

resource "local_file" "add_ips_to_knownhosts" {
  content = templatefile("${path.module}/add_to_knownhosts.tpl", {
    all_host_data = local.all_host_data
  })
  filename = "${path.module}/add_to_knownhosts.bash"
  file_permission = "0700"
}
