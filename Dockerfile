FROM ubuntu:bionic

RUN apt update && \
    apt install -y libnss3 libgtk-3-0 libx11-xcb1 libxss1 libasound2 desktop-file-utils && \
    apt install -y fonts-droid-fallback && \
    apt clean && rm -rf /var/lib/apt/lists/*

ARG BAIDUNETDISK_URL="http://wppkg.baidupcs.com/issue/netdisk/LinuxGuanjia/3.0.1/baidunetdisk_linux_3.0.1.2.deb"
RUN apt update && apt install -y  wget && \
    cd /tmp && wget $BAIDUNETDISK_URL && dpkg -i baidunetdisk_linux_*.deb && rm baidunetdisk_linux_*.deb && \
    apt remove -y wget && apt autoremove -y && apt clean && rm -rf /var/lib/apt/lists/*

ARG NOVNC=/opt/noVNC
RUN apt update && apt install -y wget git && \
    export DEBIAN_FRONTEND=noninteractive && apt install -y vnc4server xfce4 python3 && \
    git clone --depth 1 https://github.com/novnc/noVNC.git $NOVNC && \
    git clone --depth 1 https://github.com/novnc/websockify.git $NOVNC/utils/websockify && \
    find ${NOVNC} -name ".git*" | xargs rm -rf && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    ln -s $NOVNC/vnc.html $NOVNC/index.html && \
    touch /root/.Xauthority && \
    apt remove -y wget git && apt autoremove -y && apt clean && rm -rf /var/lib/apt/lists/*
COPY vnc /root/.vnc

COPY baidunetdisk_entrypoint.sh /
ENTRYPOINT ["/baidunetdisk_entrypoint.sh"]

