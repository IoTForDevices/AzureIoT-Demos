#!/bin/bash

#######################################################################################
# This script creates an Azure API for FHIR service in the specified resource group.
# 
# To access the Azure API for FHIR, a user must have administrative rights for their
# Azure subscription (this doesn't work using an internal MSFT subscription)
#
# This script makes us of the az cli, make sure to have logged in to az cli prior
# to running this script.
#
# The script has a relatively long execution time of approx. 4 minutes
#
# NOTE: Keeping the Azure API for FHIR up and running after showcasing it wil
#       cost you around Euro 30 / day.
#######################################################################################

show_help() {
    echo "Command"
    echo "  create-azure-api-for-fhir: Create a new instance of the Azure API for FHIR"
    echo ""
    echo "Arguments"
    echo "  --resource-group -r     [Required] - Name of the resource group to create the Azure API for FHIR instance in."
    echo "  --fhir-account -a       [Required] - Name of the Azure API for FHIR instance to be created."
    echo "  --location -l           [Required] - Name of the region where the Azure API for FHIR instance is created."
    echo "  --help -h                          - Show this help message and exit."
}

RG_NAME=""
FHIR_ACCOUNT_NAME=""
DEMO_LOCATION=""

OPTS=`getopt -n 'parse-options' -o ha:l:r: --long help,fhir-account:,location:,resource-group: -- "$@"`

eval set -- "$OPTS"

#extract options and their arguments into variables
while true ; do
    case "$1" in
        -h | --help )
            show_help
            exit 0
            ;;
        -a | --fhir-account )
            FHIR_ACCOUNT_NAME="$2"; shift 2 ;;
        -l | --location )
            DEMO_LOCATION="$2"; shift 2 ;;
        -r | --resource-group )
            RG_NAME="$2"; shift 2 ;;
        \? )
            echo "Invalid Option"
            exit 0
            ;;
        --) shift; break;;
        *) break;;
    esac
done

if [[ -z "$RG_NAME" || -z "$FHIR_ACCOUNT_NAME" || -z "$DEMO_LOCATION" ]]; then
    show_help
    exit 1
fi

# Create a resource group
az group create --location $DEMO_LOCATION --name $RG_NAME

# Deploy the Azure API for FHIR
az healthcareapis service create \
    --resource-group $RG_NAME --resource-name $FHIR_ACCOUNT_NAME \
    --kind "fhir-r4" --location $DEMO_LOCATION \
    --identity-type "SystemAssigned"

# Fetch FHIR API capability statement
curl --url "https://$FHIR_ACCOUNT_NAME.azurehealthcareapis.com/metadata"