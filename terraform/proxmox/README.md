# Proxmox Terraform Stack

Collection of Terraform components for provisioning VMs on a Proxmox cluster using the community `bpg/proxmox` provider.

## Structure

- `modules/vm/` – Reusable VM module that clones templates, configures guest settings, and exposes SSH metadata. See its [README](modules/vm/README.md).
- `environments/k3s/` – Opinionated environment for a three-node K3s lab. Usage details live in the [environment guide](environments/k3s/README.md).
- Root files (for example `main.tf`, `providers.tf`) show how to compose modules for quick experiments.

## Getting Started

1. Generate or provide SSH keys alongside the Terraform files (`id_rsa`/`id_rsa.pub`).
2. Review the environment README for the scenario you want to deploy.
3. Populate a `terraform.tfvars` file with your Proxmox endpoint and machine definitions.
4. Run `terraform init` followed by `terraform apply` from the chosen environment directory.

Add more environments or modules under this folder to grow the Proxmox automation catalog.
