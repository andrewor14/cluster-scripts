#!/bin/bash

if [[ "$#" -ne 1 ]]; then
  echo "Usage: ./copy-to-all.sh [file or directory]"
  exit 1
fi

while read address; do
  scp -r $1 $address:~
done < slaves

