#!/bin/bash

export SCRIPT_PATH=$(pwd)
REPO_URI=https://github.com/notro/rpi-firmware rpi-update

echo "fbtft_device name=rpi-display  gpios=reset:25,dc:24,led:18 speed=32000000 rotate=90 bgr=1" >> /etc/modules
echo "$(cat /boot/cmdline.txt) fbtft_device.name=rpi-display fbtft_device.gpios=reset:25,dc:24,led:18 fbtft_device.speed=32000000 fbtft_device.rotate=90 fbtft_device.verbose=2 fbcon=map:10,rotate:1 fbcon=font::ProFont6x11" > /boot/cmdline.txt

con2fbmap 1 1
echo ""
echo "fbtft module installation and tft configuration is done"
echo ""

read -p "Do you want to configure X server to work on fbtft device ? (y/n)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	apt-get -y install xserver-xorg-video-fbdev
	cp $SCRIPT_PATH/xorg-fbdev.conf /usr/share/X11/xorg.conf.d/99-fbdev.conf
fi

read -p "Do you want to install framebuffer image viewer ?(y/n)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	apt-get -y install fbi
fi

echo "Installation done. Please reboot the board to load the new configuration."
echo "Please remember to run 'con2fbmap 1 1' after reboot if you can't see the console on the tft lcd."

