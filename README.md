SilverBase
==========

A custom Fedora Silverblue image.

Usage
-----

    sudo rpm-ostree rebase --experimental ostree-unverified-registry:ghcr.io/aguslr/silverbase:latest

Features
--------

- Start with a base Fedora Silverblue 37 image
- Adds the following packages to the base image:
  + `distrobox`
  + `gnome-tweaks`
  + `podman-compose`
  + `podman-docker`
- Adds RPM Fusion repositories and several multimedia packages.
- Sets automatic checking of updates for the system
- Reduce *systemd* shutdown timers.

References
----------

- [Building your own custom Fedora Silverblue image][1]
- [ublue-os/base: Base image: Silverblue with unfiltered Flathub, distrobox, and
  automatic updates][2]


[1]: https://www.ypsidanger.com/building-your-own-fedora-silverblue-image/
[2]: https://github.com/ublue-os/base
