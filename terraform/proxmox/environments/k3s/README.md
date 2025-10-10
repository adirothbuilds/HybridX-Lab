# Proxmox K3s Environment

Terraform configuration for provisioning a small K3s cluster on Proxmox. This folder consumes the reusable `vm` module and orchestrates multiple VMs, outputs, and helper files such as the Ansible inventory and SSH bootstrap script.

## Files

- `main.tf` – Instantiates the `vm` module for each entry in `machines`, wiring in networking and hardware settings.
- `variables.tf` – Declares environment-level inputs including the Proxmox connection details and machine map.
- `resources.tf` – Renders the Ansible inventory and generates an `add_to_knownhosts.bash` helper by feeding module outputs and machine data into templates.
- `outputs.tf` – Exposes handy maps of VM IPs and SSH commands after apply.
- `terraform.tfvars.example` – Sample values for a K3s lab with one master and two workers; copy to `terraform.tfvars` to get started.
- `ansible_inventory.tpl` – Template that formats VM IPs into an Ansible inventory without CIDR suffixes.
- `add_to_knownhosts.tpl` – Template for a script that calls `ssh-copy-id` with the correct usernames and key paths for every host.

## Workflow

1. Copy the example tfvars file, adjust Proxmox endpoint, token, and machine definitions.
2. Run `terraform init` and `terraform apply` inside this directory.
3. After apply, use `inventory.ini` and the `ssh_commands` output to bootstrap K3s with Ansible or your preferred tooling.
4. Execute the generated `add_to_knownhosts.bash` script if you want to pre-populate SSH known_hosts or distribute keys automatically.

Extend the `machines` map to scale the cluster or adjust roles. Naming conventions determine which host becomes the master in the generated inventory (currently matches `master`).
