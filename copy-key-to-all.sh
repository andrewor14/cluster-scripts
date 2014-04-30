#!/bin/bash

if [[ "$#" -ne 2 ]]; then
  echo "Usage: ./copy-key-to-all [key] [file with hostnames]"
  exit 1
fi

while read address; do
  scp -i $1 $1 $address:~/.ssh/
done < $2

