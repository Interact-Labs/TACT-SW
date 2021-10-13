#!/bin/bash

# Link to the binary
ln -sf '/opt/TACT/TACT' '/usr/bin/TACT'

# SUID chrome-sandbox for Electron 5+
chmod 4755 '/opt/TACT/chrome-sandbox' || true

update-mime-database /usr/share/mime || true
update-desktop-database /usr/share/applications || true

#udev rules
FILE="/etc/udev/rules.d/16-tact.rules"

sudo echo "# Tact Device" > $FILE
sudo echo "SUBSYSTEMS==\"usb\", ATTRS{idProduct}==\"3d01\", ATTRS{idVendor}==\"fd1a\", MODE=\"0666\", GROUP=\"plugdev\"" >> $FILE
sudo echo "SUBSYSTEM==\"usb\", ATTRS{idVendor}==\"3d01\", ATTRS{idProduct}==\"fd1a\", MODE=\"0666\", GROUP=\"plugdev\"" >> $FILE
sudo echo "SUBSYSTEMS==\"usb_device\", ATTRS{idProduct}==\"3d01\", ATTRS{idVendor}==\"fd1a\", MODE=\"0666\", GROUP=\"plugdev\"" >> $FILE
sudo echo "SUBSYSTEM==\"usb_device\", ATTRS{idVendor}==\"3d01\", ATTRS{idProduct}==\"fd1a\", MODE=\"0666\", GROUP=\"plugdev\"" >> $FILE
sudo echo "KERNEL==\"hidraw*\", ATTRS{busnum}==\"1\", ATTRS{idVendor}==\"3d01\", ATTRS{idProduct}==\"fd1a\", MODE=\"0666\", GROUP=\"plugdev\"" >> $FILE