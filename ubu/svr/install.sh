#!/bin/bash
set -e

qpushd libseawolf
qpushd build

# You shouldn't use ls in a script,
# its meant for humans to view not scripts.
# But dpkg doesnt glob so oh well
PKGS="$(ls | grep *.deb)"

for pkg in "${PKGS[@]}"
do
    sudo dpkg -i "$pkg"
done

qpopd
qpopd
