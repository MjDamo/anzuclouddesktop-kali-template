#!/bin/bash
export DISPLAY=:1
Xvfb :1 -screen 0 1920x1080x24 &
sleep 2
sudo /usr/bin/supervisord -c /etc/supervisor/conf.d/desktop.conf &
echo "Desktop started on port 6080"