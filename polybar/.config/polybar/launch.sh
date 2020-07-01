#!/usr/bin/env sh

# Terminate already running bar instances
pkill -e polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch top and botom
polybar top &
polybar bottom &

echo "Bars launched..."
