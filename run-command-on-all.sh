#!/bin/bash

# Note: This does not execute with sudo or support quoted script arguments

if [[ "$#" -lt 1 ]]; then
  echo "Usage: ./run-command-on-all.sh [script] <script-args>"
  exit 1
fi

script="$1"
shift

while read address; do
  log_file_name="$script-$address.log"
  echo "* Logging to $log_file_name"
  ssh $address "bash -s" < "$script" "$@" &> "$log_file_name" &
done < slaves

