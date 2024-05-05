#!/bin/bash

if [ "$UID" -ne "0" ]
then
  echo "You are not root. Exiting.."
  exit 1
fi

ssh-keygen -t rsa -b 2048
cat ~/.ssh/id_rsa.pub | \
     ssh it@10.0.2.5 \
       'mkdir -p ~/.ssh; cat > ~/.ssh/authorized_keys'
       
cat ~/.ssh/id_rsa.pub | \
     ssh it@10.0.2.6 \
       'mkdir -p ~/.ssh; cat > ~/.ssh/authorized_keys'