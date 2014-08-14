#!/bin/bash

if [[ "$#" -ne 1 ]]; then
  echo "Usage: ./copy-key-to-all [key]"
  exit 1
fi

while read address; do
  scp -i $1 $1 $address:~/.ssh/
done < slaves

