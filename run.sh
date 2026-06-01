#!/usr/bin/with-contenv bashio
set -e

CONFIG_PATH=/data/options.json
HERMES_HOME=$(bashio::config 'hermes_home')
export HERMES_HOME="${HERMES_HOME:-/data/hermes}"

mkdir -p "$HERMES_HOME"

if [ ! -f "$HERMES_HOME/config.yaml" ]; then
    echo "=============================================="
    echo "  HERMES AGENT - FIRST TIME SETUP"
    echo "=============================================="
    echo ""
    echo "Run: hermes setup"
    echo ""
    echo "After setup, type 'exit' and restart the"
    echo "add-on. Hermes will start automatically."
    echo "=============================================="
    cd "$HERMES_HOME"
    exec /bin/bash
fi

echo "Starting Hermes Agent gateway..."
cd "$HERMES_HOME"
exec hermes gateway run
