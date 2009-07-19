#!/bin/sh

IFACE=em0

set `vmstat -i | fgrep ${IFACE} | cut -c 20-`

/bin/echo $1
/bin/echo 0
/usr/bin/uptime
/bin/echo "${IFACE} Interrupts"
