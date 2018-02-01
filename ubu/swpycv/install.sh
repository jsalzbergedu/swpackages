#!/bin/bash

PKGS="$(ls | grep *.deb)"

for pkg in "${PKGS[@]}"
do
    sudo dpkg -i "$pkg"
done
