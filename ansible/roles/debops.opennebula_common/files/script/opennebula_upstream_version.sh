#!/bin/sh

# Get the latest OpenNebula major version
curl -s -N 'https://downloads.opennebula.org/repo/?C=M;O=A' | sed -e 's/<[^>]*>/ /g' -e '/^\s*$/d' -e 's#/##g' | tail -n 1 | awk '{print $1}'

