ARG FEDORA_MAJOR_VERSION=40

FROM quay.io/fedora/fedora-silverblue:${FEDORA_MAJOR_VERSION}

COPY rootfs/ /
COPY cosign.pub /etc/pki/containers/

RUN <<-'EOT' sh
	set -eu

	systemctl enable dconf-update.service
	systemctl enable flatpak-add-flathub-repo.service
	systemctl enable flatpak-replace-fedora-apps.service
	systemctl enable flatpak-cleanup.timer
	systemctl enable rpm-ostreed-automatic.timer

	bg_file=$(find /usr/share/backgrounds/gnome/ -name 'adwaita-*.*' -print -quit) && \
		sed -i 's|\.ext|.'"${bg_file##*.}"'|' /etc/dconf/db/local.d/01-background

	case "$(rpm -E %fedora)" in
		39)
			rpm-ostree override remove \
				gnome-classic-session
			;;
		40)
			rpm-ostree override remove \
				gnome-classic-session \
				gnome-classic-session-xsession
			;;
	esac

	rpm-ostree install gcc gnome-backgrounds-extras gnome-tweaks
	rpm-ostree override remove \
		gnome-shell-extension-apps-menu \
		gnome-shell-extension-launch-new-instance \
		gnome-shell-extension-places-menu \
		gnome-shell-extension-window-list \
		gnome-shell-extension-background-logo

	rpm-ostree cleanup -m && ostree container commit
EOT
