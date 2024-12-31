#!/bin/bash

set -e

bw config server ${BW_HOST}

BW_CLIENTID=${BW_CLIENTID} BW_CLIENTSECRET=${BW_CLIENTSECRET} bw login --apikey --raw

export BW_SESSION=$(bw unlock --passwordenv BW_PASSWORD --raw)
bw unlock --check

echo 'Running `bw server` on port 8087'
bw serve --hostname 0.0.0.0 #--disable-origin-protection
