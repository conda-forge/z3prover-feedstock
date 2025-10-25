#!/usr/bin/env bash

set -xe

mkdir -p build_py && cd build_py

cmake .. -G "Ninja" \
    ${CMAKE_ARGS} \
    -DCMAKE_INSTALL_PYTHON_PKG_DIR=${SP_DIR} \
    -DPython3_EXECUTABLE=${PYTHON} \
    -DZ3_BUILD_PYTHON_BINDINGS=TRUE \
    -DZ3_INSTALL_PYTHON_BINDINGS=TRUE \
    -DZ3_BUILD_LIBZ3_SHARED=TRUE \
    -DZ3_INCLUDE_GIT_DESCRIBE=FALSE \
    -DZ3_INCLUDE_GIT_HASH=FALSE \
    -DZ3_BUILD_DOCUMENTATION=FALSE
ninja install
