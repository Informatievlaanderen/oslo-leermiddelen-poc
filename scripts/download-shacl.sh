#!/usr/bin/env bash

DIR=in-shacl
FILE="$DIR/shacl.ttl"

if [ -d "DIR" ]; then
  echo "DIR already exists."
else
  mkdir $DIR
fi

if [[ -f "$FILE" ]]; then
  echo "$FILE already exists."
else
  echo "Downloading SHACL."
  curl -L "$1" -o $FILE
fi

