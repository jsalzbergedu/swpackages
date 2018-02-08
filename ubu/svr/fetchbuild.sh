#!/bin/bash
set -e
git clone -b packaging https://github.com/jsalzbergedu/svr.git
qpushd svr
mkdir build
qpushd build
cmake -DCMAKE_INSTALL_PREFIX=/usr .. -GNinja
ninja
cpack -G DEB
qpopd
qpopd
