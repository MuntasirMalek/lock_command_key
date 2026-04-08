#!/bin/bash

# Explicitly use the user
USER_HOME="/Users/utsho"
PLIST="$USER_HOME/Library/Preferences/com.apple.universalaccess"
LOGfile="/tmp/sticky_toggle.log"

echo "Script started at $(date)" >> "$LOGfile"

# PLAY SOUND FIRST (Proof of life)
afplay /System/Library/Sounds/Ping.aiff

CURRENT=$(/usr/bin/defaults read "$PLIST" stickyKey)
echo "Current state: $CURRENT" >> "$LOGfile"

if [ "$CURRENT" = "1" ]; then
    echo "Toggling OFF..." >> "$LOGfile"
    /usr/bin/defaults write "$PLIST" stickyKey -bool false
    # Play 'Basso' for OFF
    afplay /System/Library/Sounds/Basso.aiff &
    osascript -e 'display notification "Sticky Keys is now OFF" with title "🔓 Unlocked"'
else
    echo "Toggling ON..." >> "$LOGfile"
    /usr/bin/defaults write "$PLIST" stickyKey -bool true
    # Play 'Hero' for ON
    afplay /System/Library/Sounds/Hero.aiff &
    osascript -e 'display notification "Sticky Keys is now ON" with title "🔒 Locked"'
fi

# Reload the process
echo "Reloading universalaccessd..." >> "$LOGfile"
/usr/bin/killall -HUP universalaccessd

echo "Done at $(date)" >> "$LOGfile"
