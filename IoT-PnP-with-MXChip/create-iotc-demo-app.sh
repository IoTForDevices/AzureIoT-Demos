#!/bin/bash

RG_NAME="rg-iotc-demo-mst01"
IOTC_NAME="iotc-demo-mst01"
SUBDOMAIN_NAME="iotc-demo-mst01"
DISPLAY_NAME="IOTC Demo MST01"

# Create a resource group for the IoT Central application
az group create --location "West Europe" --name $RG_NAME

# Create an IoT Central application
az iot central app create \
  --resource-group $RG_NAME \
  --name $IOTC_NAME --subdomain $SUBDOMAIN_NAME \
  --sku ST1 --template "iotc-pnp-preview" \
  --display-name "$DISPLAY_NAME"

