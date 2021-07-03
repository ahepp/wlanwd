# wlanwd

Configures a Raspberry Pi Zero W that can't reach cloudflare DNS to disconnect and broadcast a rescue wifi network.

## Installation

From a bare Raspbian install:

    $ chmod +x ./setup.sh
    $ sudo ./setup.sh

Expert users may be able to adapt this project to work on other Debian-like systems.
Extreme caution should be taken.

## Rescuing your system

The default rescue network name is "rescue" with a password of "rescueme".
Remote access through something like ssh must be separately enabled.
Triggering wlanwd sets wlan0's IP address to 192.168.1.2/16.

To exit rescue mode, execute `$ sudo systemctl stop wlanwd-ap.service`, or reboot the device with a configuration that will allow `scripts/test.sh` to successfully complete.

## About

wlanwd is comprised of:

 * Shell scripts to enter and exit AP mode (broadcast a wifi network).
 * systemd unit files to trigger the scripts when network connectivity is lost.

Settings for the rescue wifi network are found in `conf/hostapd.conf` .

DHCP settings for the rescue wifi network are found in `conf/dnsmasq.conf`.

Watchdog trigger settings can be configured in `scripts/test.sh`.
For instance, you may prefer test your home router rather than an internet address.

