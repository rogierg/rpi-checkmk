#!/bin/bash
echo "First run, creating site monitor..."
omd create --no-tmpfs monitor
omd config monitor set APACHE_MODE own
omd config monitor set APACHE_TCP_ADDR 0.0.0.0
omd config monitor set APACHE_TCP_PORT 5000
omd config monitor set CORE nagios
omd enable monitor