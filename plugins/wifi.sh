#!/usr/bin/env sh

CURRENT_WIFI="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)"
SSID="$(echo "$CURRENT_WIFI" | grep -o "SSID: .*" | sed 's/^SSID: //')"
CURR_TX="$(echo "$CURRENT_WIFI" | grep -o "lastTxRate: .*" | sed 's/^lastTxRate: //')"

icon_off="􀙈"
icon_on="􀙇"

if [ "$SSID" = "" ]; then
  sketchybar --set $NAME label="Disconnected $icon_off" 
else
  sketchybar --set $NAME label="(${CURR_TX}Mbps) $icon_on" 
fi

#   sketchybar --set $NAME label="$SSID (${CURR_TX}Mbps)" icon="􀙇"

