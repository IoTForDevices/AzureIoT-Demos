#!/bin/bash

RG_NAME="rg-fhir-demo-mst01"

# Remove the resource group and the Azure API for FHIR service it contains
az group delete --name $RG_NAME -y
