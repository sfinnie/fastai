#!/bin/bash
echo "Starting VM..."
az vm start --resource-group fastai2 --name fastai2
IP=$(az vm show -d -g fastai2 -n fastai2 --query publicIps -o tsv)
echo "VM started, Jupyter notebook available at https://${IP}:8000/"
echo "Login with username fastuser"
git web--browse https://${IP}:8000/
# az vm list-ip-addresses --resource-group fastai2 --name fastai2 -o table
