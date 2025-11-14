#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

$SCRIPT_DIR/reset-readme.sh
rm -rf example-data \
  mappings \
  in-shacl \
  data \
  docs \
  output \
  template.xlsx \
  env.txt

mkdir docs
cp $SCRIPT_DIR/docs-placeholder.html $SCRIPT_DIR/../docs/index.html
