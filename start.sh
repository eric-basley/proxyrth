#!/bin/bash

PRG="/proxy"
CONFIG="/config"

PARAMS="params.js"

ln -fs "$CONFIG/$PARAMS" "$PRG/$PARAMS"

echo "Running proxy ..."
DEBUG=main:* node server
