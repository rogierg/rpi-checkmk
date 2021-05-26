#!/bin/bash
echo "First run, creating site mon..."
omd create --no-tmpfs mon
omd config mon set APACHE_MODE own
omd config mon set APACHE_TCP_ADDR 0.0.0.0
omd config mon set APACHE_TCP_PORT 5000
omd config mon set CORE nagios
omd enable mon
