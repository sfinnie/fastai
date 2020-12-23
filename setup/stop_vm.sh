#!/bin/bash
echo "Stopping VM..."
az vm deallocate --resource-group fastai2 --name fastai2
./vm_status.sh