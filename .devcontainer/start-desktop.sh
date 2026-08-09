#!/bin/bash
if ! pgrep -x "supervisord" > /dev/null; then
    echo "Starting desktop services..."
    supervisord -c /etc/supervisor/conf.d/desktop.conf &
    sleep 5
    echo "Desktop services started!"
    echo "Access desktop at: http://localhost:6080/vnc.html"
else
    echo "Desktop services already running"
fi