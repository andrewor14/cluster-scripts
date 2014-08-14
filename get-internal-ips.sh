#!/bin/bash

if [[ "$#" -ne 0 ]]; then
  echo "Usage: ./get-internal-ips.sh"
  exit 1
fi

while read address; do
  INTERNAL_IP=$(ssh $address hostname -i < /dev/null)
  echo "$INTERNAL_IP"
done < slaves

