#!/bin/bash
set -e
git clone -b cmake-and-clang https://github.com/jsalzbergedu/libseawolf.git
qpushd libseawolf
mkdir build
qpushd build
cmake -DCMAKE_INSTALL_PREFIX=/usr .. -GNinja
ninja
cpack -G DEB
qpopd
qpopd
