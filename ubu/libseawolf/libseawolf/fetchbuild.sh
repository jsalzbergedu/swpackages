#!/bin/bash
git clone -b cmake-and-clang https://github.com/jsalzbergedu/libseawolf.git
pushd libseawolf
mkdir build
pushd build
cmake -DCMAKE_INSTALL_PREFIX=/usr .. -GNinja
ninja
cpack -GDEB
popd
popd
