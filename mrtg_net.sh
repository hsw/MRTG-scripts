#!/bin/sh

IFACE=em0

set `netstat -I ${IFACE} -b -W -f inet -n | tail +2`

/bin/echo $7
/bin/echo ${10}
/usr/bin/uptime
/bin/echo "${IFACE} Network Load"
