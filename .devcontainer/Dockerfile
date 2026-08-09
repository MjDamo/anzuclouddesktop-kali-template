FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:1

# نصب بسته‌های لازم (حداقل)
RUN apt-get update && apt-get install -y --no-install-recommends \
    kali-desktop-xfce \
    dbus-x11 \
    x11vnc \
    xvfb \
    novnc \
    websockify \
    supervisor \
    firefox-esr \
    curl \
    git \
    sudo \
    procps \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# تنظیم sudo بدون password
RUN echo "ALL ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nopasswd

# ایجاد user vscode
RUN useradd -m -s /bin/bash vscode \
    && usermod -aG sudo vscode \
    && echo "vscode:vscode" | chpasswd

# تنظیم VNC password
USER vscode
RUN mkdir -p /home/vscode/.vnc \
    && echo "anzucloud" | vncpasswd -f > /home/vscode/.vnc/passwd \
    && chmod 600 /home/vscode/.vnc/passwd

# کپی supervisor config
COPY --chown=root:root supervisord.conf /etc/supervisor/conf.d/supervisord.conf

USER root
WORKDIR /home/vscode