#!/bin/bash

wall "wlanwd triggered, exiting AP mode"

systemctl stop dnsmasq.service
systemctl stop hostapd.service

ifdown wlan0
ifup wlan0
ip addr flush dev wlan0 

systemctl start wpa_supplicant.service
systemctl start dhcpcd.service
#systemctl start wlanwd.timer
