#!/bin/bash

kernel=$(uname)

if [ $kernel = "Linux" ]; then
    sed -i -u -e 's/^DEVICE=.*$/DEVICE=DEVICE_UPDATEME/'  .env
    device=$(ls /dev/ttyACM* || echo /dev/ttyACM0)
    sed -i -e s@DEVICE_UPDATEME@${device}@  .env
elif [ $kernel = "Darwin" ]; then
    sed -u -i '' 's/^DEVICE=.*$/DEVICE=DEVICE_UPDATEME/' .env
    device=$(ls /dev/cu.usb* || echo /dev/cu.usbmodem11203)
    sed -i '' s@DEVICE_UPDATEME@${device}@g  .env
fi
