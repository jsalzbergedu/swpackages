#!/bin/bash
set -e
pkgdir="$PWD/swpycv-pylib"
mkdir "$pkgdir"

git clone -b cmake-and-clang https://github.com/jsalzbergedu/swpycv.git
qpushd swpycv
mkdir build
qpushd build
cmake -DCMAKE_INSTALL_PREFIX=/usr .. -GNinja
ninja

# Going into the python dir
qpopd

# Using setup.py
python2 setup.py install --root="$pkgdir/" --optimize=1

# Finish packaging 
qpopd
cp -r DEBIAN "$pkgdir/"
dpkg -b swpycv-pylib
