#!/bin/bash

# Set your template ID and node name
TEMPLATE_ID=9000
NODE_NAME="lab-00"
BRIDGE="vmbr0"

# Define VM specs (VMID, NAME, CORES, RAM in MB, DISK in GB)
vms=(
  "100 k8s-master   4 8192 40"
  "101 k8s-worker-1 4 8192 40"
  "102 k8s-worker-2 4 8192 40"
  "103 k8s-tools    2 4096 20"
  "104 jump-host    1 1024 10"
)

# Loop through and create VMs
for vm in "${vms[@]}"; do
  read -r VMID NAME CORES RAM DISK <<< "$vm"

  echo "➡️  Creating VM $NAME (VMID: $VMID)..."

  qm clone $TEMPLATE_ID $VMID --name $NAME --target $NODE_NAME --full
  qm set $VMID --cores $CORES --memory $RAM --net0 virtio,bridge=$BRIDGE
  qm set $VMID --ipconfig0 ip=dhcp
  qm resize $VMID scsi0 +${DISK}G

  echo "✅ $NAME created with $CORES vCPU, ${RAM}MB RAM, +${DISK}G disk"
done

# Start all VMs
echo "🚀 Starting all VMs..."
for vm in "${vms[@]}"; do
  read -r VMID NAME _ <<< "$vm"
  qm start $VMID
  echo "✅ Started $NAME (VMID: $VMID)"
done

echo "🎉 Kubernetes cluster and jump host provisioning complete!"
