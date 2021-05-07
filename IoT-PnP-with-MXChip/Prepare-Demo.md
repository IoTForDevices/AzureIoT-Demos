# Prepare IoT PnP with MXChip Demo

## Introduction

In order to show the [IoT PnP with MXChip demo](./Demo-Showtime.md), you need to setup the demo environment. For this demo, you will need a [MXChip device](https://en.mxchip.com/az3166). Setting up the demo environment for the first time will take approximately **60 minutes**.

If you already have cloned and build the repo for the tutorial, you can immediately proceed to the [IoT PnP with MXChip demo](./Demo-Showtime.md).

## Prerequisites

* A PC running Microsoft Windows 10
* [Git](https://git-scm.com/downloads) for cloning the repository
* Hardware

    > * The MXCHIP AZ3166 IoT DevKit (MXCHIP DevKit)
    > * Wi-Fi 2.4 GHz
    > * USB 2.0 A male to Micro USB male cable

## Prepare the development environment

To set up your development environment, first you clone a GitHub repo that contains all the assets you need for the tutorial. Then you install a set of programming tools. Once you have done it, it is adviced to keep the cloned repo as well as all programming tools installed on your PC. In that way you can quickly reproduce the demo without going through all steps to setup tools again. If you want to keep your PC clean from all kinds of tools, you can consider building the image inside a [dev container](https://code.visualstudio.com/docs/containers/choosing-dev-environment).

## Building the MXChip image

The very first time you want to run this demo, you need to build the MXChip image from scratch. You can do so by running some steps from [this quickstart](https://docs.microsoft.com/en-us/azure/iot-develop/quickstart-devkit-mxchip-az3166). To make this setup easier for you, the necessary steps are also availabele in this document.

### Clone the repo for the tutorial

Clone the following repo to download all sample device code, setup scripts, and offline versions of the documentation. If you previously cloned this repo in another tutorial, you don't need to do it again.

To clone the repo, run the following command:

```shell
git clone --recursive https://github.com/azure-rtos/getting-started.git
```

### Install the tools

The cloned repo contains a setup script that installs and configures the required tools. If you installed these tools in another tutorial in the getting started guide, you don't need to do it again.

> [!NOTE]
> The setup script installs the following tools:
> * [CMake](https://cmake.org): Build
> * [ARM GCC](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm): Compile
> * [Termite](https://www.compuphase.com/software_termite.htm): Monitor serial port output for connected devices

To install the tools:

1. From File Explorer, navigate to the following path in the repo and run the setup script named *get-toolchain.bat*:

    > *getting-started\tools\get-toolchain.bat*

1. After the installation, open a new console window to recognize the configuration changes made by the setup script. Use this console to complete the remaining programming tasks in the tutorial. You can use Windows CMD, PowerShell, or Git Bash for Windows.
1. Run the following code to confirm that CMake version 3.14 or later is installed.

    ```shell
    cmake --version
    ```

### Add WiFi configuration

1. Open the following file in a text editor:

    > *getting-started\MXChip\AZ3166\app\azure_config.h*

1. Set the Wi-Fi constants to the following values from your local environment.

    |Constant name|Value|
    |-------------|-----|
    |`WIFI_SSID` |{*Your Wi-Fi SSID*}|
    |`WIFI_PASSWORD` |{*Your Wi-Fi password*}|
    |`WIFI_MODE` |{*One of the enumerated Wi-Fi mode values in the file*}|

### Build the image

In your console or in File Explorer, run the script *rebuild.bat* at the following path to build the image:

> *getting-started\MXChip\AZ3166\tools\rebuild.bat*

After the build completes, confirm that the binary file was created in the following path:

> *getting-started\MXChip\AZ3166\build\app\mxchip_azure_iot.bin*

You now have an image that can be flashed to the MXChip device. However, before the actual demo, you need to make sure that the MXChip is correctly configured. This is explained in the actual demo description. To conginue, please proceed to the [IoT PnP with MXChip demo](./Demo-Showtime.md).
