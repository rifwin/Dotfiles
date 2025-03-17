#!/bin/bash

arg=$@
deviceId="${arg#--id=}"

#echo $deviceId
#echo $pwd

cacheFile="$HOME/.config/hypr/scripts/cache/touchpad"

if [ -f $cacheFile ]; then 
  notify-send "touchpad off"
  rm $cacheFile
  hyprctl keywords device[$deviceId]:enabled false
else
  notify-send "touchpad on"
  touch $cacheFile
  hyprctl keywords device[$deviceId]:enabled true
fi
