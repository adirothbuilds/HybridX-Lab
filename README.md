# HybridX Lab

HybridX Lab explores end-to-end DevOps patterns for provisioning clusters, evolving server configurations with automation, and operating across hybrid and multi-tenant clouds. The repository showcases workflows that span infrastructure rollout, configuration management, and day-two operations without locking into a single platform.

- Infrastructure resources live under [`terraform/`](terraform/README.md), with the Proxmox stack detailed in [`terraform/proxmox/`](terraform/proxmox/README.md).
- Module internals and environment-specific runbooks are documented alongside their code, for example the [`vm` module guide](terraform/proxmox/modules/vm/README.md) and the [`k3s` environment walkthrough](terraform/proxmox/environments/k3s/README.md).

More automation footprints will be added over time; follow the breadcrumbs in each directory to dive deeper.
