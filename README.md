[VanillaBlue][1]
================

A custom Fedora Silverblue image.

Usage
-----

    sudo rpm-ostree rebase --experimental ostree-unverified-registry:ghcr.io/aguslr/vanillablue:latest

Features
--------

- Start with a base Fedora Silverblue 37 image
- Add the following packages:
  + `distrobox`
  + `gnome-tweaks`
  + `podman-compose`
  + `podman-docker`
- Add RPM Fusion repositories and several multimedia packages.
- Set automatic checking of updates for the system.
- Reduce *systemd* shutdown timers.
- Replace filtered Flathub repository with unfiltered one.
- Remove Fedora's Flatpak repository and replace all its packages with the
  ones from Flathub.
- Restore GNOME's default background.
- Add keyboard shortcuts:
  + Open Terminal into the system's shell: `<Control><Alt>t`
  + Open Terminal into the default Distrobox container: `<Super>Return`

References
----------

- [Building your own custom Fedora Silverblue image][2]
- [GitHub - ublue-os/base: Base image: Silverblue with unfiltered Flathub,
  distrobox, and automatic updates][3]
- [GitHub - ublue-os/ubuntu: Fedora Silverblue for Ubuntu Expatriates][4]


[1]: https://github.com/aguslr/vanillablue
[2]: https://www.ypsidanger.com/building-your-own-fedora-silverblue-image/
[3]: https://github.com/ublue-os/base
[4]: https://github.com/ublue-os/ubuntu
