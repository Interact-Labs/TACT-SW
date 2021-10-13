#!/bin/bash

# Delete the link to the binary
rm -f '/usr/bin/TACT'

#udev rules
FILE="/etc/udev/rules.d/16-tact.rules"
sudo rm $FILE