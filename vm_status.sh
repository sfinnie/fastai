#!/bin/sh
az vm get-instance-view --resource-group fastai2 --name fastai2 -o table
IP=$(az vm show -d -g fastai2 -n fastai2 --query publicIps -o tsv)
echo "Jupyter notebook available at https://${IP}:8000/"
