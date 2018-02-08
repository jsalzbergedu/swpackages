#!/bin/bash
set -e
pkgdir="$PWD/svr-pylib"
mkdir "$pkgdir"

git clone -b packaging https://github.com/jsalzbergedu/svr.git
qpushd svr
mkdir build
qpushd build
cmake -DCMAKE_INSTALL_PREFIX=/usr .. -GNinja
ninja

# Going into the python dir
qpopd
qpushd python

# Using setup.py
python2 setup.py build_ext build
python2 setup.py install --root="$pkgdir/" --optimize=1

qpopd
qpopd

# Finish packaging 
cp -r DEBIAN "$pkgdir/"
dpkg -b svr-pylib
