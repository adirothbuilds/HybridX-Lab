# HybridX Terraform Configuration

This directory contains Terraform code for provisioning Ubuntu virtual machines on Proxmox using the community `bpg/proxmox` provider. The configuration is split between an environment example and a reusable module.

## Structure

- `proxmox/main.tf` wires user-provided values into the `vm` module.
- `proxmox/terraform.tfvars.example` documents the inputs required to provision a VM.
- `proxmox/modules/vm` contains the reusable module that encapsulates VM cloning, guest initialization, and common defaults.

## Getting Started

1. Generate or supply an SSH key pair inside this directory. The repository includes an `id_rsa`/`id_rsa.pub` pair for local testing; replace them with your own keys before deploying to production.
2. Copy `terraform.tfvars.example` to `terraform.tfvars` and fill in the Proxmox endpoint, API token, and VM networking values.
3. Set the required environment variables for the Proxmox provider, for example:

   ```sh
   export PROXMOX_VE_ENDPOINT=https://proxmox.example.com:8006/api2/json
   export PROXMOX_VE_TOKEN_ID=terraform@pve!token-name
   export PROXMOX_VE_TOKEN_SECRET=super-secret
   ```

4. Initialize and apply:

   ```sh
   terraform init
   terraform apply
   ```

## Module Highlights

- Clones a template VM by ID and enables full clones.
- Configures CPU, memory, networking, and storage using module variables with sensible defaults.
- Injects the provided SSH public key and builds a ready-to-use SSH command output.

Refer to the module's `variables.tf` and `outputs.tf` files for the complete list of tunable inputs and available outputs.
