#!/bin/bash
echo "First run, creating site mon..."
omd create --no-tmpfs mon
omd config mon set APACHE_MODE own
omd config mon set APACHE_TCP_ADDR 0.0.0.0
omd config mon set APACHE_TCP_PORT 5000
omd config mon set CORE nagios
omd update-apache-config mon
groupadd -g 1000 mon
useradd -g 1000 -u 1000 -ms /bin/bash -d /omd/sites/mon mon
usermod -aG mon www-data
usermod -aG omd mon
omd enable mon
