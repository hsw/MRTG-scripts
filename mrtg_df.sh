#!/bin/sh

set `/bin/df -kl | /usr/bin/tail -1`

/bin/echo $3
/bin/echo $2
/usr/bin/uptime
/bin/echo "disk usage of $1"
