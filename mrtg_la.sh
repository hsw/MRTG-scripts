#!/bin/sh

LC_ALL=C uptime | perl -ne '@F = /^\s*\S+\s+up\s+([^,]+,[^,]+),.+load averages: ([0-9.]+), ([0-9.]+), ([0-9.]+)/; print $F[2]*100,"\n",$F[1]*100,"\n",$F[0],"\n";' && echo `/bin/hostname` load average
