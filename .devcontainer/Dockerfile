FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

# نصب همه بسته‌های لازم
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

# تنظیم sudo بدون password
RUN echo "ALL ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nopasswd \
    && chmod 0440 /etc/sudoers.d/nopasswd

# ایجاد user vscode
RUN useradd -m -s /bin/bash vscode \
    && usermod -aG sudo vscode \
    && echo "vscode:vscode" | chpasswd

# تنظیم VNC password
USER vscode
RUN mkdir -p /home/vscode/.vnc \
    && echo "anzucloud" | vncpasswd -f > /home/vscode/.vnc/passwd \
    && chmod 600 /home/vscode/.vnc/passwd

USER root