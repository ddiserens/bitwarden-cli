#!/bin/bash

set -e

bw config server ${BW_HOST}

export BW_SESSION=$(BW_CLIENTID=${BW_CLIENTID} BW_CLIENTSECRET=${BW_CLIENTSECRET} bw login --apikey)

bw unlock --check

echo 'Running `bw server` on port 8087'
bw serve --hostname 0.0.0.0 #--disable-origin-protection
