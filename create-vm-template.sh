#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Variables
VMID=9000
VM_NAME="template-ubuntu-2404"
MEMORY=2048
CORES=2
NETWORK="virtio,bridge=vmbr0"
ISO_PATH="/var/lib/vz/template/iso/ubuntu-24.04.2-live-server-amd64.iso"
DISK_SIZE="10"

# Create VM
qm create $VMID --name "$VM_NAME" --memory $MEMORY --cores $CORES --net0 $NETWORK --cdrom $ISO_PATH
qm set $VMID --scsihw virtio-scsi-pci --scsi0 local-zfs:$DISK_SIZE --boot c --bootdisk scsi0

# Then manually install the OS from the ISO
# ...
# Then run create-cluster.sh