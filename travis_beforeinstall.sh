#!/usr/bin/env bash

pip install --user -r mbed-os/requirements.txt
mbed new .

chmod +x mbed-ci/toolchain_install.sh
. mbed-ci/toolchain_install.sh && linux_default_download

mbed config GCC_ARM_PATH $HOME/bin
$HOME/bin/arm-none-eabi-gcc --version

# bootloader build
export ARMGCC_VERSION="4.9.3"
download_one
ls -la ${TC_HOME}

