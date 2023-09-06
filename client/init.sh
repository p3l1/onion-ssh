#!/bin/sh

echo USER: $USER_NAME
echo ADDRESS: $ONION_ADDRESS
echo Arguments: $@

# torsocks.conf apparently cant resolve dns names and only accepts ip addresses,
# so we use dig to insert the ip address of the tor_proxy container

# Examples:
#
# Direct access to OpenSSH container
# torify --address $(dig tor_proxy +short) --port 9050 ssh $USER_NAME@$ONION_ADDRESS -p 2222

# Using the OpenSSH container as jumphost
# torify --address $(dig tor_proxy +short) --port 9050 ssh -J $USER_NAME@$ONION_ADDRESS:2222 root@example.org
torify --address $(dig tor_proxy +short) --port 9050 ssh $@
