#!/bin/bash -xe

cd $(dirname $0)
apt-get install -y \
    curl \
    dnsmasq \
    hostapd

systemctl stop dnsmasq
systemctl disable dnsmasq
systemctl unmask hostapd
systemctl stop hostapd
systemctl disable hostapd

#cp /usr/share/doc/avahi-daemon/examples/ssh.service /etc/avahi/services/
cp conf/hostapd.conf /etc/hostapd/hostapd.conf
cp conf/dnsmasq.conf /etc/dnsmasq.conf

chmod +x wlanwd
cp wlanwd /usr/bin/

cp systemd/wlanwd-ap.service /etc/systemd/system/
cp systemd/wlanwd.service /etc/systemd/system/
#cp systemd/wlanwd.timer /etc/systemd/system/

systemctl daemon-reload
systemctl enable wlanwd.service
#systemctl enable wlanwd.timer


