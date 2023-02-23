[BlueVanilla][1]
================

[![build-image](https://github.com/aguslr/bluevanilla/actions/workflows/build.yml/badge.svg)](https://github.com/aguslr/bluevanilla/actions/workflows/build.yml)

A Fedora Silverblue image that uses vanilla GNOME and FlatHub apps.

![Screenshot](https://github.com/aguslr/bluevanilla/raw/main/screenshot.png "Screenshot")

Usage
-----

    sudo rpm-ostree rebase --experimental ostree-unverified-registry:ghcr.io/aguslr/bluevanilla:latest

Features
--------

- Start with a base Fedora Silverblue image.
- Add the `gnome-tweaks` package.
- Restore GNOME's default background.
- Replace filtered Flathub repository with unfiltered one.
- Remove Fedora's Flatpak repository and replace all its packages with the
  ones from Flathub.
- Set automatic checking of updates for the system.
- Reduce *systemd* shutdown timers.

Verification
------------

These images are signed with Sisgstore's [Cosign][5]. You can verify the
signature by downloading the `cosign.pub` key from this repo and running the
following command:

    cosign verify --key cosign.pub ghcr.io/aguslr/bluevanilla

References
----------

- [Building your own custom Fedora Silverblue image][2]
- [GitHub - ublue-os/base: Base image: Silverblue with unfiltered Flathub,
  distrobox, and automatic updates][3]
- [GitHub - ublue-os/ubuntu: Fedora Silverblue for Ubuntu Expatriates][4]
- [Cosign - Sigstore Documentation][5]
- [Making your Own - Universal Blue][6]


[1]: https://github.com/aguslr/bluevanilla
[2]: https://www.ypsidanger.com/building-your-own-fedora-silverblue-image/
[3]: https://github.com/ublue-os/base
[4]: https://github.com/ublue-os/ubuntu
[5]: https://docs.sigstore.dev/cosign/overview/
[6]: https://ublue.it/making-your-own/
