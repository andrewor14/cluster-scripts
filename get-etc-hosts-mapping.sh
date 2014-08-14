#!/bin/bash

# The YARN ResourceManager web UI uses internal addresses, which makes it a pain
# to navigate around it in the browser. To ease this pain, this script produces
# lines to be added to the /etc/hosts of the machine that visits this UI.

if [[ "$#" -ne 0 ]]; then
  echo "Usage: ./get-etc-hosts-mapping.sh"
  exit 1
fi

while read address; do
  EXTERNAL_IP=$(ssh $address curl -ss http://169.254.169.254/latest/meta-data/public-ipv4 < /dev/null)
  INTERNAL_HOSTNAME=$address
  echo "$EXTERNAL_IP $INTERNAL_HOSTNAME"
done < slaves

