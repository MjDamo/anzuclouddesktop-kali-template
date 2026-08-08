#!/bin/bash
set -e

echo "Setting up AnzuCloud Kali Desktop..."

# Create supervisor directory
sudo mkdir -p /etc/supervisor/conf.d

# Create desktop startup script
sudo tee /etc/supervisor/conf.d/desktop.conf > /dev/null <<'EOF'
[supervisord]
nodaemon=false
logfile=/tmp/supervisord.log
pidfile=/tmp/supervisord.pid

[program:xfce]
command=/usr/bin/xfce4-session
environment=DISPLAY=":1",HOME="/home/vscode",USER="vscode"
user=vscode
autostart=true
autorestart=true
priority=10

[program:vnc]
command=/usr/bin/x11vnc -display :1 -forever -shared -rfbport 5901 -passwd anzucloud
environment=DISPLAY=":1",HOME="/home/vscode",USER="vscode"
user=vscode
autostart=true
autorestart=true
priority=20

[program:novnc]
command=/usr/bin/websockify --web /usr/share/novnc 6080 localhost:5901
environment=HOME="/home/vscode",USER="vscode"
user=vscode
autostart=true
autorestart=true
priority=30
EOF

# Create startup script
sudo tee /usr/local/bin/start-desktop.sh > /dev/null <<'EOF'
#!/bin/bash
export DISPLAY=:1
Xvfb :1 -screen 0 1920x1080x24 &
sleep 2
sudo /usr/bin/supervisord -c /etc/supervisor/conf.d/desktop.conf &
EOF

sudo chmod +x /usr/local/bin/start-desktop.sh

echo "Setup complete!"