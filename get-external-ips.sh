#!/bin/bash

if [[ "$#" -ne 0 ]]; then
  echo "Usage: ./get-external-ips.sh"
  exit 1
fi

while read address; do
  EXTERNAL_IP=$(ssh $address curl -ss http://169.254.169.254/latest/meta-data/public-ipv4 < /dev/null)
  echo "$EXTERNAL_IP"
done < slaves

