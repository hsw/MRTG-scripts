#!/bin/sh

set `/usr/sbin/iostat -d -C -t proc -c 2 | /usr/bin/tail +4`

/bin/echo $(expr $1 + $2)
/bin/echo $(expr $3 + $4)
/usr/bin/uptime
/bin/echo "CPU load"
