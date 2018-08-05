#!/usr/bin/sh

pip install --user mbed-cli
mbed deploy
pip install --user -r mbed-os/requirements.txt
mbed new .

chmod +x mbed-ci/toolchain_install.sh
. mbed-ci/toolchain_install.sh && linux_default_download

mbed config GCC_ARM_PATH $HOME/bin
$HOME/bin/arm-none-eabi-gcc --version
