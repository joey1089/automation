#!/bin/bash

# This script checks for network connectivity

site = "www.google.com"

# Check if this site can be reached
if ping -c 1 "$host" &>/dev/null; then
    echo "Internet is connected!"
else
    echo "Internet is down!"
fi

