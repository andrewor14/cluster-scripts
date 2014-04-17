#!/bin/bash

while read address; do
  ssh -t -t ec2-user@$address 'sudo bash -s' < $1
done < $2

