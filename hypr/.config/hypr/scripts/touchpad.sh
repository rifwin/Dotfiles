#!/bin/bash

# args 
actionName=""
deviceId=""

# cache file location
cacheFile="$HOME/.config/hypr/scripts/cache/touchpad"

# if cache file is found then delete file & turn off touchpad
# if not then create file and turn on touchpad
touchpadToggle() {
  if [ -f $cacheFile ]; then 
    notify-send "touchpad off" -t 1000
    rm $cacheFile
    hyprctl keywords device[$deviceId]:enabled false
  else
    notify-send "touchpad on" -t 1000
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

# parse argument
for arg in "$@"; do
  case $arg in
    --id=*)
      deviceId="${arg#*=}"
      shift
      ;;
    --action=*)
      actionName="${arg#*=}"
      shift
      ;;
    *)
      notify-send "Unkown argument: $arg"
      ;;
  esac
done

case $actionName in 
  toggle)
    touchpadToggle
    ;;
  init)
    touchpadInit
    ;;
  *)
    notify-send "Unkown action $actionName"
    ;;
esac





