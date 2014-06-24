#!/bin/bash

if [[ "$#" -ne 1 ]]; then
  echo "Usage: ./get-internal-ips.sh [file with hostnames]"
  exit 1
fi

while read address; do
  INTERNAL_IP=$(ssh $address hostname -i < /dev/null)
  echo "$INTERNAL_IP"
done < $1

