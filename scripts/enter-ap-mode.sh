#!/bin/bash

wall "wlanwd triggered, entering AP mode"

#systemctl stop wlanwd.timer
systemctl stop dhcpcd.service
systemctl stop wpa_supplicant.service

ifdown wlan0
ifup wlan0
ip addr flush dev wlan0 
ip addr add dev wlan0 192.168.1.2/16

systemctl start hostapd.service
systemctl start dnsmasq.service
