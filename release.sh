#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

temp_dir=$(mktemp -d)
trap "rm -rf $temp_dir" 0 2 3 15

pushd $temp_dir

cp -r $DIR mep
rm -rf mep/.git* mep/README.md mep/release.sh mep/mep.zip mep/screenshot.png
cd mep/data/languages
sleigh -a
cd ../../..
zip -r mep.zip mep
cp mep.zip $DIR

popd

echo ""
ls -la mep.zip
