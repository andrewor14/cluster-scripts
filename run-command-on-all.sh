#!/bin/bash

# Note: This does not execute with sudo or support quoted script arguments

if [[ "$#" -lt 1 ]]; then
  echo "Usage: ./run-command-on-all.sh [script] <script-args>"
  exit 1
fi

script="$1"
shift

while read address; do
  echo "* Running $1 on $address"
  ssh $address "bash -s" < "$script" "$@"
done < slaves

