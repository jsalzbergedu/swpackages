#!/bin/bash
set -e

# I really dont like this. But I can't find another way to glob for the .deb
PKGS="$(ls | grep *.deb)"

for pkg in "${PKGS[@]}"
do
    sudo dpkg -i "$pkg"
done
