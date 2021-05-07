#!/bin/bash

RG_NAME="rg-iotc-demo-mst01"
IOTC_NAME="iotc-demo-mst01"

az iot central app delete --name $IOTC_NAME --resource-group $RG_NAME
az group delete --name $RG_NAME
