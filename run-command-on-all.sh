#!/bin/bash

# Note: This does not execute with sudo

if [[ "$#" -ne 1 ]]; then
  echo "Usage: ./run-command-on-all [script]"
  exit 1
fi

while read address; do
  echo "* Running $1 on $address"
  ssh $address 'bash -s' < $1
done < slaves

