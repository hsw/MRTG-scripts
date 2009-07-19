#! /bin/sh

URL=$1

DATA=`/usr/bin/fetch -qo - ${URL} | /usr/bin/head -4 | /usr/bin/tail -1`

echo `echo ${DATA} | /usr/bin/cut -f 2 -d ' '`
echo `echo ${DATA} | /usr/bin/cut -f 4 -d ' '`
/usr/bin/uptime
echo 'nginx connections'
