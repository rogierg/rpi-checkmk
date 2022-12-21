#!/bin/bash
curl -O $(curl -s https://api.github.com/repos/chrisss404/check-mk-arm/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep jammy_arm64.deb)
dpkg -i check-mk-raw-*.jammy_arm64.deb
rm check-mk-raw-*.jammy_arm64.deb
/usr/bin/omd stop
/usr/bin/omd update monitoring
/usr/bin/omd start
/usr/bin/omd cleanup
