#!/bin/bash
source .env
set -x

sudo cp my-config.js "$CONFIG/web/config.js"
