#!/bin/bash

if [ "$UID" -ne "0" ]
then
  echo "You are not root. Exiting.."
  exit 1
fi

for i in $(nmap -sP 10.0.2.0/28 | grep "^Nmap s" | \
  grep -v "\.[123]$" | grep -v "\.15" | \
  grep -Po "([0-9]+\.?){4}")
do
   ssh it@$i 'hostname; facter | \
      grep -A 20 "memory =>" | \
      grep -A 10 "system =>" | grep "total =>"'
done
