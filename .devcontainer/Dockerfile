FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    kali-desktop-xfce \
    xfce4-terminal \
    dbus-x11 \
    x11vnc \
    xvfb \
    novnc \
    websockify \
    supervisor \
    firefox-esr \
    curl \
    git \
    wget \
    unzip \
    nano \
    htop \
    sudo \
    procps \
    net-tools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN echo "ALL ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nopasswd \
    && chmod 0440 /etc/sudoers.d/nopasswd

RUN useradd -m -s /bin/bash vscode \
    && usermod -aG sudo vscode \
    && echo "vscode:vscode" | chpasswd

COPY supervisord.conf /etc/supervisor/conf.d/desktop.conf

USER vscode
RUN mkdir -p /home/vscode/.vnc \
    && echo "anzucloud" | vncpasswd -f > /home/vscode/.vnc/passwd \
    && chmod 600 /home/vscode/.vnc/passwd

USER root

COPY start-desktop.sh /usr/local/bin/start-desktop.sh
RUN chmod +x /usr/local/bin/start-desktop.sh