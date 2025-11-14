#!/usr/bin/env bash

FILE=README.md
BACKUP_FILE=original-README.md

if [[ -f "$BACKUP_FILE" ]]; then
  echo "$FILE is already updated."
else
  echo "Updating $FILE."
  sed -e "s@{{AP-URL}}@$1@g" -e "s@{{SHACL-URL}}@$2@g" $FILE > temp.md
  cp $FILE $BACKUP_FILE
  mv temp.md $FILE
fi
