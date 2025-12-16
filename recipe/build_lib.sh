#!/usr/bin/env bash

set -xe

mkdir -p build_lib && cd build_lib

cmake .. -G "Ninja" \
    ${CMAKE_ARGS} \
    -DZ3_BUILD_LIBZ3_CORE=ON \
    -DZ3_BUILD_LIBZ3_SHARED=TRUE \
    -DZ3_INCLUDE_GIT_DESCRIBE=FALSE \
    -DZ3_INCLUDE_GIT_HASH=FALSE \
    -DZ3_BUILD_DOCUMENTATION=FALSE
ninja install
