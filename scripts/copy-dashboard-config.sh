#!/usr/bin/env bash

DIRECTORY=dashboard-config

if [ -d "$DIRECTORY" ]; then
  echo "$DIRECTORY exists."
  rm -rf ap-data-to-dashboard/miravi-initial-config
  mv $DIRECTORY ap-data-to-dashboard/miravi-initial-config
else
  echo "$DIRECTORY doesn't exist. Using initial config."
fi

