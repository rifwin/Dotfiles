#!/bin/bash

# args 
deviceId="elan1200:00-04f3:3045-touchpad"

# cache file location
cacheFile="$HOME/.config/hypr/scripts/cache/touchpad"

# if cache file is found then delete file & turn off touchpad
# if not then create file and turn on touchpad
touchpadToggle() {
  if [ -f $cacheFile ]; then 
    notify-send "touchpad off" -t 1000 -u low
    rm $cacheFile
    hyprctl keywords device[$deviceId]:enabled false
  else
    notify-send "touchpad on" -t 1000 -u low
    touch $cacheFile
    hyprctl keywords device[$deviceId]:enabled true
  fi
}

# init touchpad on startup
# if cache file found then set touchpad on, if not set to off
touchpadInit() {
  if [ -f $cacheFile ]; then 
    hyprctl keywords device[$deviceId]:enabled true
  else
    hyprctl keywords device[$deviceId]:enabled false
  fi
}

case $@ in
  init)
    touchpadInit
    ;;
  toggle)
    touchpadToggle
    ;;
  *)
    notify-send "unknown args $@" -t 1000 -u low
    ;;
esac

