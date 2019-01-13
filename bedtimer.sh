#!/bin/bash
ar_days_of_week_when_active=(
	Monday
	Tuesday
	Wednesday
	Thursday
	Sunday
)

# 24 hour time with no colons
BLACKOUTSTART=200
BLACKOUTEND=400

# If today is a blackout day then
if [[ " ${ar_days_of_week_when_active[*]} " == $(date '+%A') ]]; then
	# And if it's during the blackout time
	if [[ $(date '+%H%M') -ge "$BLACKOUTSTART" ]] || [[ $(date '+%H%M') -le "$BLACKOUTEND" ]]; then
		# Turn off internet here
		echo "Turning wifi off"
		nmcli networking off
	else
		echo "Turning wifi on"
		nmcli networking on
	fi
else
	echo "Turning wifi on!"
	nmcli networking on
fi

#thanks to this post for writing much of this script https://www.reddit.com/r/SolusProject/comments/ae2dwe/help_turning_off_networkingwifi_with_systemd/edupoyf/
