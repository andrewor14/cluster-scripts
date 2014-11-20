#!/bin/bash

# Note: This does not support quoted script arguments

if [[ "$#" -lt 1 ]]; then
  echo "Usage: ./run-command-on-all.sh [script] <script-args>"
  exit 1
fi

script="$1"
shift

# This is needed in RHEL systems because there is an issue
# with forcing pseudo TTY to execute scripts in sudo
./copy-to-all.sh "$script" > /dev/null

while read address; do
  script_name="$(basename $script)"
  log_file_name="log/$script_name-$address.log"
  echo "* Logging to $log_file_name"
  ssh -t -t $address "sudo ./$script_name $@; rm $script_name" &> "$log_file_name" &
done < slaves

wait
echo "=== All done ==="
