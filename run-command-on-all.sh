#!/bin/bash

if [[ "$#" -ne 1 ]]; then
  echo "Usage: ./run-command-on-all [script]"
  exit 1
fi

while read address; do
  ssh -t -t $address 'sudo bash -s' < $1 > /dev/null &
  echo "* Running $1 on $address"
done < slaves

