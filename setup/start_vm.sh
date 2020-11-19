#!/bin/bash
echo "Starting VM..>"
az vm start --resource-group fastai2 --name fastai2
az vm list-ip-addresses --resource-group fastai2 --name fastai2 -o table
