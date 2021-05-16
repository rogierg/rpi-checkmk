#!/bin/bash
if [ ! -d /omd/sites/mon ]; then
  ./init.sh
fi
omd start mon
sleep infinity
