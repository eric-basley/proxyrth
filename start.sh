#!/bin/bash

PRG="/proxy"
CONFIG="/config"

PARAMS="params.js"

cd "$PROXY"

ln -fs "$CONFIG/$PARAMS" "$PRG/$PARAMS"

echo "Running proxy ..."
DEBUG=main:* node server
