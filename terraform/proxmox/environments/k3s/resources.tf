locals {
  master_ips = [
    for name, vm in module.cluster_vms :
    vm.vm_ip_address if length(regexall("master", name)) > 0
  ]

  worker_ips = [
    for name, vm in module.cluster_vms :
    vm.vm_ip_address if length(regexall("master", name)) == 0
  ]
}

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/ansible_inventory.tpl", {
    master_ip  = one(local.master_ips)
    worker_ips = local.worker_ips
  })
  filename = "${path.module}/inventory.ini"
}
