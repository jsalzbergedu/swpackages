#!/bin/bash
set -e

qpushd libseawolf
qpushd build

# This is horrible. Oh well.
PKGS="$(ls | grep *.deb)"

for pkg in "${PKGS[@]}"
do
    sudo dpkg -i "$pkg"
done

qpopd
qpopd
