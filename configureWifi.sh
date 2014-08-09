#!/bin/bash

echo "Please make sure to configure ssid and password first !"

export WIFI_SSID="your ssid here"
export WIFI_PASSWORD="your password here"

export SCRIPT_PATH=$(pwd)

rm /etc/network/interfaces

cp $SCRIPT_PATH/temp_interfaces /etc/network/interfaces 

cp $SCRIPT_PATH/temp_wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf
sed -i -e "s/TEMP_SSID/$WIFI_SSID/" -e "s/TEMP_PASSWORD/$WIFI_PASSWORD/"  /etc/wpa_supplicant/wpa_supplicant.conf

echo "Wifi Configuration Done"
