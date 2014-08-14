#!/bin/bash

if [[ "$#" -ne 0 ]]; then
  echo "Usage: ./get-internal-hostnames.sh"
  exit 1
fi

while read address; do
  INTERNAL_NAME=$(ssh $address hostname -f < /dev/null)
  echo "$INTERNAL_NAME"
done < slaves

