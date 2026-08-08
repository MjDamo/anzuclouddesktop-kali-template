FROM kalilinux/kali-rolling

# Install XFCE desktop and required packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y --no-install-recommends \
        kali-desktop-xfce \
        kali-desktop-common \
        novnc \
        websockify \
        x11vnc \
        supervisor \
        firefox-esr \
        curl \
        git \
        wget \
        unzip \
        nano \
        htop \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN useradd -m -s /bin/bash vscode \
    && echo "vscode:vscode" | chpasswd \
    && usermod -aG sudo vscode

# Set up VNC password
RUN mkdir -p /home/vscode/.vnc \
    && echo "anzucloud" | vncpasswd -f > /home/vscode/.vnc/passwd \
    && chmod 600 /home/vscode/.vnc/passwd \
    && chown -R vscode:vscode /home/vscode/.vnc

USER vscode