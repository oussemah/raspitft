raspitft
========

Some custom scripts to setup a Raspebrry Pi to work with wifi and a 2.2 QVGA TFT hosting an ILI9341 or ILI9340 controller

 * Wifi Configuration :
  - Make sure to update the script configureWifi.bash with your ssid and password, then invoke it with root privileges
  - Then reboot your pi and you should get wifi running at boot time

 * fbtft installation & tft lcd configuration for the QVGA 2.2 spi tft lcd
  - Make sure to enable spi module loading using rasi-config or by editing /etc/modprobe.d/raspi-blacklist.conf directly
  - Then launch installFbtft.sh with root privileges
  - Finally reboot the board, and you should see the boot log on the tft (after a short blanking moment)

 > In case you don't know it yet, the tft lcd module used here is the one available at http://www.aliexpress.com/store/product/2-2-inch-TFT-LCD-module-with-SPI-serial-port-ILI9341-drive-IC-240-320/224898_1292229328.html

 PS: I customized the settings based on rpi-display settings because it fits more the controller of the display (more then adafriut's ili9340) and runs faster (32M instead of 16M for adafrtui's ili9340)

