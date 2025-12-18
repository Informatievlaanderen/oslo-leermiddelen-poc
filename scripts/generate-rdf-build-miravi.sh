#!/usr/bin/env bash

WORKDIR="_local"

rm -rf $WORKDIR
mkdir $WORKDIR

if compgen -G "data/*.xlsx" > /dev/null; then
  cd $WORKDIR
  git clone --revision=2bb5bd334f8d708d1e337eb7c4a9251856c636d1 --depth 1 https://github.com/RMLio/ap-data-to-dashboard.git ap-data-to-dashboard
  rm -rf ap-data-to-dashboard/in
  mkdir ap-data-to-dashboard/in
  cp ../data/* ap-data-to-dashboard/in
  cp ../in-shacl/* ap-data-to-dashboard/in-shacl

  cd ap-data-to-dashboard
  npm i
  npm run setup
  cd ..

  rm -rf ap-data-to-dashboard/miravi-initial-config
  mkdir ap-data-to-dashboard/miravi-initial-config
  cp -r ../dashboard-config/* ap-data-to-dashboard/miravi-initial-config

  cd ap-data-to-dashboard
  ./run.sh
  cd ..

  rm -rf docs && mkdir docs
  mv ap-data-to-dashboard/node_modules/miravi/main/dist/* docs

  rm -rf output
  mkdir output
  rm -rf mappings
  mkdir mappings
  mv ap-data-to-dashboard/out/serve-me/* output/
  mv ap-data-to-dashboard/out/*.rml.ttl mappings/
  mv ap-data-to-dashboard/out/*.yml mappings/

  echo "1. Host RDF files via \"npx http-server _local/output -p 5500 --cors\""
  echo "2. Host Miravi via \"npx http-server _local/docs -p 8080\""
  echo "3. Browse to http://localhost:8080"
else
  echo "No Excel files found in the data folder."
  exit 1
fi
