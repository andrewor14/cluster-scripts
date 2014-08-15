#!/bin/bash

if [[ "$#" -ne 1 ]]; then
  echo "Usage: ./copy-key-to-all.sh [key]"
  exit 1
fi

while read address; do
  scp -i $1 $1 $address:~/.ssh/
done < slaves

