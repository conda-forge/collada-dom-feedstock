#!/bin/sh

# Make sure that vendored libraries are not used
rm -rf ./dom/external-libs

mkdir build
cd build

# We specify the use of C++14 as std::auto_ptr is used in the public interface, so we can't patch it without an ABI break
cmake -GNinja ${CMAKE_ARGS} .. \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_CXX_STANDARD=14 \
      -DCMAKE_CXX_STANDARD_REQUIRED=ON

cmake --build . --config Release
cmake --build . --config Release --target install
