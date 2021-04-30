#!/usr/bin/env sh

if [ "$3" = "close" ]; then
    logger "/etc/acpi/actions/lid.sh: Deactivating fingerprint reader."
    echo 0 > /sys/bus/usb/devices/1-9:1.0/authorized
else
    logger "/etc/acpi/actions/lid.sh: Activating fingerprint reader."
    echo 1 > /sys/bus/usb/devices/1-9:1.0/authorized
fi
