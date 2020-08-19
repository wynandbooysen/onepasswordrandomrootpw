#!/bin/bash

while read p; do
  echo "Updating passwords for server login items"
  op edit item "$p" --vault LinuxRootPasswords --generate-password=16,letters,digits
done <nodes
