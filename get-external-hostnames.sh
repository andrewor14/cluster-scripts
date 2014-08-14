#!/bin/bash

if [[ "$#" -ne 0 ]]; then
  echo "Usage: ./get-external-hostnames.sh"
  exit 1
fi

while read address; do
  EXTERNAL_NAME=$(ssh $address curl -ss http://169.254.169.254/latest/meta-data/public-hostname < /dev/null)
  echo "$EXTERNAL_NAME"
done < slaves

