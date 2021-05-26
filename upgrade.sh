#!/bin/bash
curl -LO $(curl -s https://api.github.com/repos/chrisss404/check-mk-arm/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep buster_armhf.deb)
dpkg -i check-mk-raw-*.buster_armhf.deb
rm check-mk-raw-*.buster_armhf.deb
/usr/bin/omd stop
/usr/bin/omd update mon
/usr/bin/omd start
/usr/bin/omd cleanup