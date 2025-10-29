#!/usr/bin/env bash

set -eu

USAGE="Usage: $(basename "$0") <server ZIP URL>"
source ./config.sh

if [ $# -lt 1 ]; then
	echo -e "$USAGE"
	exit 1
fi

ZIP_URL="$1"
ZIP_FILENAME="$(echo "$ZIP_URL" | rev | cut -d '/' -f 1 | rev)"
RUN_DIR_PATH="$(pwd)/$RUN_DIR"

if [ -d "$RUN_DIR_PATH" ]; then
	echo "Run directory '$RUN_DIR_PATH' already exists! Aborting"
	exit 2
fi

echo "Server ZIP filename: $ZIP_FILENAME"

echo "Downloading ZIP archive..."
wget -q "$ZIP_URL"

echo "Unpacking archive in directory ${RUN_DIR_PATH}..."
unzip -qo "$ZIP_FILENAME" -d "$RUN_DIR_PATH"

echo "Injecting run script..."
cp "../run_server.sh" "$RUN_DIR_PATH/"
chmod +x "$RUN_DIR_PATH/run_server.sh"
