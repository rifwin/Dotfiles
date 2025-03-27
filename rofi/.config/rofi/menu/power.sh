#!/bin/sh

themeDir="$HOME/.config/rofi/themes/power.rasi"

shutdown="󰐥"
reboot="󰜉"
sleep="󰤄"
logout="󰈆"

selection=$(echo -e\
  "$shutdown\n$reboot\n$sleep\n$logout" |\
  rofi -dmenu\
  -theme $themeDir\
  -mesg "Power Options"
)

confirmCmd() {
  echo -e "Yes\nNo" |\
    rofi -dmenu\
    -theme $themeDir\
    -theme-str "window {width: 316px;}"\
    -mesg "Are You Sure ?"
}

case "$selection" in
    $shutdown)
        confirmVar=$(confirmCmd)
        if [ "$confirmVar" = "Yes" ]; then 
          systemctl poweroff
        fi
        ;;
    $reboot)
        confirmVar=$(confirmCmd)
        if [ "$confirmVar" = "Yes" ]; then 
          systemctl reboot
        fi
        ;;
    $sleep)
        confirmVar=$(confirmCmd)
        if [ "$confirmVar" = "Yes" ]; then 
          systemctl suspend
        fi
        ;;
    $logout)
        confirmVar=$(confirmCmd)
        if [ "$confirmVar" = "Yes" ]; then 
          uwsm stop
        fi
        ;;
    *)
        echo "Invalid option"
        ;;
esac

