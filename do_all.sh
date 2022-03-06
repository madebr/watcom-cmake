#!/bin/sh

set -e

cmake -S . -B build-dos-protected -DCMAKE_TOOLCHAIN_FILE=$PWD/cmake/watcom-DOS-protected.cmake
cmake --build build-dos-protected --verbose
cmake --build build-dos-protected --target package

cmake -S . -B build-dos-real -DCMAKE_TOOLCHAIN_FILE=$PWD/cmake/watcom-DOS-real.cmake
cmake --build build-dos-real --verbose
cmake --build build-dos-real --target package

cmake -S . -B build-windows -DCMAKE_TOOLCHAIN_FILE=$PWD/cmake/watcom-Windows.cmake
cmake --build build-windows
cmake --build build-windows --target package
