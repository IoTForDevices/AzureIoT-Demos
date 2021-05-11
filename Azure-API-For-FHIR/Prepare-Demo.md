# Prepare Azure API for FHIR Demo

## Introduction
In order to show the [Azure API for FHIR demo](./Demo-Showtime.md), you need to setup the demo environment. For this purpose you can find a number of different scripts to automate this as much as possible. Setting up the demo environment will take approximately <TODO> minutes.
## Prerequisites
To setup the demo, you need to execute a number of bash scripts. These scripts all make use of the [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli), which has to be installed prior to running the scripts. You also need to have the HealthcareAPIs extension installed:

```shell
az extension add --name healthcareapis
```

> At the moment of creating this description, the healtcareapis extension is in preview and the official documentation is not up-to-date. Make sure to follow all instructions as described in this preparation document to get a proper working FHIR service.

### Creating the Azure API for FHIR service

In a WSL terminal or in an Azure Cloud Shell, execute the following script:

``` shell
./create-azure-api-for-fhir.sh
```

The script contains a few variables that you might want to set to create a unique name for your FHIR service. The variables are self explanatory.
