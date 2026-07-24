#!/bin/sh

DIR="$HOME/images/screenshots"
mkdir -p "$DIR"
FILE="$DIR/$(date +%F_%H-%M-%S).png"

timeout 10 slurp > /tmp/selection.txt 2>/dev/null
if [ $? -eq 0 ] && [ -s /tmp/selection.txt ]; then
    grim -g "$(cat /tmp/selection.txt)" -t png "$FILE" | wl-copy --type image/png
else
    grim -t png "$FILE" | wl-copy --type image/png
fi
rm -f /tmp/selection.txt
