#!/bin/bash
echo "             __              __                __              __    "
echo ".----.-----.|__|______.----.|  |--.-----.----.|  |--.--------.|  |--."
echo "|   _|  _  ||  |______|  __||     |  -__|  __||    <|        ||    < "
echo "|__| |   __||__|      |____||__|__|_____|____||__|__|__|__|__||__|__|"
echo "     |__|     "
if [ ! -d /omd/sites/mon ]; then
  # /bin/bash /app/init.sh
  omd create --no-tmpfs monitoring
fi
omd start monitoring
sleep infinity
