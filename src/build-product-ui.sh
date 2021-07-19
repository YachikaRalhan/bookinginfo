#!/bin/bash

set -o errexit

if [ "$#" -ne 2 ]; then
    echo "Incorrect parameters"
    echo "Usage: build-services.sh <version> <prefix>"
    exit 1
fi

VERSION=$1
PREFIX=$2
SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

pushd "$SCRIPTDIR/productpage"
  docker build --pull -t "${PREFIX}/examples-bookinfo-productpage-v1:${VERSION}" -t "${PREFIX}/examples-bookinfo-productpage-v1:latest" .
  #flooding
  docker build --pull -t "${PREFIX}/examples-bookinfo-productpage-v-flooding:${VERSION}" -t "${PREFIX}/examples-bookinfo-productpage-v-flooding:latest" --build-arg flood_factor=100 .
popd