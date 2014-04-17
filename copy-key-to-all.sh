#!/bin/bash

while read address; do
  scp -i $1 $1 ec2-user@$address:~/.ssh/
done < $2

