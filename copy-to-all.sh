#!/bin/bash

if [[ "$#" -ne 2 ]]; then
  echo "Usage: ./copy-to-all [file or directory] [file with hostnames]"
  exit 1
fi

while read address; do
  scp -r $1 $address:~
done < $2

