# Cluster Proxmox Scripts

## Overview
This repository contains bash scripts to automate the creation and management of virtual machines in a Proxmox environment. The scripts are designed to simplify the provisioning of VMs for Kubernetes clusters and other use cases.

## Scripts

### 1. `create-vm-template.sh`
This script creates a VM template with the specified configuration. It uses variables for flexibility, allowing you to define the VM ID, name, memory, CPU cores, network bridge, ISO path, and disk size.

#### Usage:
```bash
bash create-vm-template.sh
```

### 2. `create-cluster.sh`
This script provisions multiple VMs based on a predefined template. It clones the template, sets VM specifications (CPU, RAM, disk size), configures networking, and starts the VMs.

#### Usage:
```bash
bash create-cluster.sh
```

## Requirements
- Proxmox VE installed and configured.
- Access to the Proxmox CLI.
- A base template VM created using `create-vm-template.sh`.

## Configuration
- Update the variables in the scripts to match your environment (e.g., VM IDs, node names, network bridge).
- Ensure the ISO file path and storage pool are correctly set.

## Example Workflow
1. Run `create-vm-template.sh` to create a base template VM.
2. Use `create-cluster.sh` to provision VMs for your cluster.

## License
This project is licensed under the MIT License.
