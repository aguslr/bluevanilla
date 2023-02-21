ARG FEDORA_MAJOR_VERSION=37

FROM quay.io/fedora-ostree-desktops/silverblue:${FEDORA_MAJOR_VERSION}
# See https://pagure.io/releng/issue/11047 for final location

COPY etc/dconf/db/local.d/ /etc/dconf/db/local.d/
COPY etc/systemd/system/ /usr/lib/systemd/system/

RUN rpm-ostree install gnome-tweaks && \
    systemctl enable dconf-update.service && \
    rm -rf /usr/share/gnome-shell/extensions/background-logo@fedorahosted.org && \
    systemctl disable flatpak-add-fedora-repos.service && \
    rm -f /usr/lib/systemd/system/flatpak-add-fedora-repos.service && \
    systemctl enable flatpak-add-flathub-repos.service && \
    systemctl enable flatpak-replace-fedora-apps.service && \
    systemctl enable flatpak-remove-fedora-repos.service && \
    sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=check/' /etc/rpm-ostreed.conf && \
    systemctl enable rpm-ostreed-automatic.timer && \
    sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=15s/' /etc/systemd/user.conf && \
    sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=15s/' /etc/systemd/system.conf && \
    rpm-ostree cleanup -m && \
    ostree container commit
