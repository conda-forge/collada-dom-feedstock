#!/bin/sh

# Make sure that vendored libraries are not used
rm -rf ./dom/external-libs

mkdir build
cd build

cmake ${CMAKE_ARGS} -DCMAKE_POLICY_VERSION_MINIMUM=3.5 .. \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
      -DCMAKE_INSTALL_LIBDIR=lib 

make -j${CPU_COUNT}
make install

