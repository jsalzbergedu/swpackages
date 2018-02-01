#!/bin/bash
set -e
pkgdir="$PWD/swpycv"
mkdir "$pkgdir"

git clone -b cmake-and-clang https://github.com/jsalzbergedu/swpycv.git
qpushd 
mkdir build
qpushd build
cmake -DCMAKE_INSTALL_PREFIX=/usr .. -GNinja
ninja

# Going into the python dir
qpopd
qpushd src
qpushd python

# Using setup.py
python2 setup.py install --root="$pkgdir/" --optimize=1

qpopd
qpopd
qpopd

# Finish packaging 
cp -r DEBIAN "$pkgdir/"
dpkg -b libseawolf-pylib
