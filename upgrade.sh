#!/bin/bash
curl -LO $(curl -s https://api.github.com/repos/chrisss404/check-mk-arm/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep bullseye_armhf.deb)
dpkg -i check-mk-raw-*.bullseye_armhf.deb
rm check-mk-raw-*.bullseye_armhf.deb
/usr/bin/omd stop
/usr/bin/omd update mon
/usr/bin/omd start
/usr/bin/omd cleanup
