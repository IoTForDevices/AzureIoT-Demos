#!/bin/bash

RG_NAME="rg-fhir-demo-mst01"
FHIR_ACCOUNT_NAME="fhiraccountmst02"
DEMO_LOCATION="westeurope"

# Create a resource group
az group create --location $DEMO_LOCATION --name $RG_NAME

# Deploy the Azure API for FHIR
az healthcareapis service create \
    --resource-group $RG_NAME --resource-name $FHIR_ACCOUNT_NAME \
    --kind "fhir-r4" --location $DEMO_LOCATION \
    --identity-type "SystemAssigned"

# Fetch FHIR API capability statement
curl --url "https://$FHIR_ACCOUNT_NAME.azurehealthcareapis.com/metadata"