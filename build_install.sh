#!/bin/bash
DIR="$( cd -P "$( dirname "$0" )" && pwd )"
pushd ${DIR} > /dev/null
ROOT_DIR=${PWD}
popd >/dev/null
BUILD_DIR=${ROOT_DIR}/build
if [ ! -d ${BUILD_DIR} ]; then
    mkdir -p ${BUILD_DIR}
fi
INSTALL_DIR=~/.emacs.d/rtags/rtags-git

pushd ${BUILD_DIR}
cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} ../
cmake --build . -j 4 --target install
popd
