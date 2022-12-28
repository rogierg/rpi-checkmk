#!/bin/bash
echo "             __              __                __              __    "
echo ".----.-----.|__|______.----.|  |--.-----.----.|  |--.--------.|  |--."
echo "|   _|  _  ||  |______|  __||     |  -__|  __||    <|        ||    < "
echo "|__| |   __||__|      |____||__|__|_____|____||__|__|__|__|__||__|__|"
echo "     |__|     "
if [ ! -d /omd/sites/monitor ]; then
  /bin/bash /app/init.sh
fi
if ! id monitor &>/dev/null; then
  groupadd -g 1000 monitor
  useradd -g 1000 -u 1000 -ms /bin/bash -d /omd/sites/monitor monitor
  usermod -aG monitor www-data
  usermod -aG omd monitor
  omd enable monitor
else
omd start monitor
sleep infinity
fi