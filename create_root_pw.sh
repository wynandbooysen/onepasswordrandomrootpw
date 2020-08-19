#!/bin/bash

while read p; do
  echo "Creating login items for servers"
  op create item login --vault LinuxRootPasswords title="$p" username=root --generate-password=16,letters,digits
done <nodes
