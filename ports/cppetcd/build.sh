#!/usr/bin/bash
#CMake projects should use: "-DCMAKE_TOOLCHAIN_FILE=/home/maxime/git/vcpkg/scripts/buildsystems/vcpkg.cmake"
set -xe
PATH_TO_BUILD_DIR="$1"
PATH_TO_SRC_DIR="$2"
PATH_TO_PACKAGE_DIR="$3"
GIT="$4"
REPO_URL="$5"
REF="$6"
HEAD_REF="$7"
LIBRARY_NAME="$8"
SHARED="$9"

cd "$PATH_TO_BUILD_DIR"
git init
git fetch ${REPO_URL} ${REF}:${HEAD_REF} --depth 50 -n --recurse-submodules=yes --update-head-ok
git checkout
git submodule init
git submodule update --depth 50
echo "=== BUILDING ==="
cd "$PATH_TO_SRC_DIR"
make clean
make CC_TARGET=$LIBRARY_NAME CC_SHARED=$SHARED -j
echo "=== INSTALLING ==="
prefix="$PATH_TO_PACKAGE_DIR" make CC_TARGET=$LIBRARY_NAME CC_SHARED=$SHARED install
echo "=== CLEANING ==="
make clean
