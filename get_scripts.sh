#!/usr/bin/env bash

set -e

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
SCRIPTS_REPOSITORY="https://github.com/maboxi/gtnh-server-scripts.git"

set -eu

if [ $# -ge 1 ]; then
    SCRIPTS_DIR="$1"
    echo "Using custom scripts directory: $SCRIPTS_DIR"
fi

SCRIPTS_DIR="${SCRIPTS_DIR:-"${SCRIPT_DIR}/scripts"}"

if [ -d "$SCRIPTS_DIR" ]; then
    echo "Removing existing scripts directory: $SCRIPTS_DIR"
    rm -r "$SCRIPTS_DIR"
fi

if which git 1>/dev/null 2>/dev/null; then
    echo "Cloning scripts repository '$SCRIPTS_REPOSITORY' into '$SCRIPTS_DIR'..."
    git clone "$SCRIPTS_REPOSITORY" "$SCRIPTS_DIR"
else
    echo "Error: scripts retreival without git is not implemented yet!"
    exit 1
fi

echo "Done. Scripts are available in '$SCRIPTS_DIR'."