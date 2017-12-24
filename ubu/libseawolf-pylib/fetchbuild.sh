#!/bin/bash
set -e

pkgdir="$PWD/libseawolf-pylib"
mkdir "$pkgdir"

git clone -b cmake-and-clang https://github.com/jsalzbergedu/libseawolf.git
qpushd libseawolf
mkdir build
qpushd build
cmake -DCMAKE_INSTALL_PREFIX=/usr .. -GNinja
ninja

# Going into the python dir
qpopd
qpushd src
qpushd python

# Using setup.py
python2 setup.py build_ext build
python2 setup.py install --root="$pkgdir/" --optimize=1

qpopd
qpopd
qpopd

# Clean out the DEBIAN dir
qpushd DEBIAN
for file in *
do
    if ! anyeq "$file" control
    then
	rm -rf "$file"
    fi
done
qpopd

# Finish packaging 
cp -r DEBIAN "$pkgdir/"
dpkg -b libseawolf-pylib
