#!/bin/bash
d=`date +%d.%m.%y`
url="http://happy-village.org/murli/?dt="
finalUrl=${url}${d}
#wallpaper http://happy-village.org/murli/
echo ${finalUrl}
wallpaper ${finalUrl} --scale=fit
