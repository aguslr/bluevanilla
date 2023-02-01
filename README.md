[SilverBase][1]
===============

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
- Replaces filtered Flathub repository with unfiltered one
- Removes Fedora's Flatpak repository and replaces all its packages with the
  ones from Flathub.

References
----------

- [Building your own custom Fedora Silverblue image][2]
- [ublue-os/base: Base image: Silverblue with unfiltered Flathub, distrobox, and
  automatic updates][3]
- [What "filter" was in place for flathub? : Fedora][4]


[1]: https://github.com/aguslr/silverbase
[2]: https://www.ypsidanger.com/building-your-own-fedora-silverblue-image/
[3]: https://github.com/ublue-os/base
[4]: https://www.reddit.com/r/Fedora/comments/rv43uv/comment/i6vvm5g/
