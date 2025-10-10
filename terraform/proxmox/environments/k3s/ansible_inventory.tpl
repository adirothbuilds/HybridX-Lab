[master]
${split("/", master_ip)[0]} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519

[workers]
%{ for ip in worker_ips ~}
${split("/", ip)[0]} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519
%{ endfor ~}
