#!/bin/sh

PAYLOAD_START=$(($(grep -a -n '^==PAYLOAD==$' "$0" | awk -F: '{ print $1 }') + 1))

INSTALL_PATH=$HOME/.isliranbusy
mkdir -p "$INSTALL_PATH"

# Extract binaries into install path
tail -n +"$PAYLOAD_START" "$0" | tar xz -C "$INSTALL_PATH"

# Add crontab entry
crontab -l | (cat ; echo "* * * * * $INSTALL_PATH/ping.sh") | crontab -

exit 0

==PAYLOAD==
