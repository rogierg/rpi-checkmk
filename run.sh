#!/bin/bash
echo "             __              __                __              __    "
echo ".----.-----.|__|______.----.|  |--.-----.----.|  |--.--------.|  |--."
echo "|   _|  _  ||  |______|  __||     |  -__|  __||    <|        ||    < "
echo "|__| |   __||__|      |____||__|__|_____|____||__|__|__|__|__||__|__|"
echo "     |__|     "
if [ ! -d /omd/sites/mon ]; then
  ./init.sh
fi
if ! id mon &>/dev/null; then
    groupadd -g 1000 mon
    useradd -g 1000 -u 1000 -ms /bin/bash -d /omd/sites/mon mon
    usermod -aG mon www-data
    usermod -aG omd mon
    omd enable mon
else
    omd start mon
    sleep infinity
fi
