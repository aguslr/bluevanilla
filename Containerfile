ARG FEDORA_MAJOR_VERSION=37

FROM ghcr.io/cgwalters/fedora-silverblue:${FEDORA_MAJOR_VERSION}
# See https://pagure.io/releng/issue/11047 for final location

RUN rpm-ostree install distrobox gnome-tweaks podman-compose podman-docker && \
    rpm-ostree install \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && \
    rpm-ostree install intel-media-driver libva-intel-driver && \
    rpm-ostree install ffmpeg gstreamer1-plugin-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-freeworld gstreamer1-plugins-ugly gstreamer1-vaapi steam-devices && \
    sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=check/' /etc/rpm-ostreed.conf && \
    systemctl enable rpm-ostreed-automatic.timer && \
    ostree container commit
