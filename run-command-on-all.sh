#!/bin/bash

# Note: This does not execute with sudo or support quoted script arguments

if [[ "$#" -lt 1 ]]; then
  echo "Usage: ./run-command-on-all.sh [script] <script-args>"
  exit 1
fi

script="$1"
shift

while read address; do
  script_name="$(basename $script)"
  log_file_name="log/$script_name-$address.log"
  echo "* Logging to $log_file_name"
  ssh $address "sudo bash -s" < "$script" "$@" &> "$log_file_name" &
done < slaves

