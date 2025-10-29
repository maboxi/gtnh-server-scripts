#!/usr/bin/env sh

set -eu

USAGE="Usage: $(basename "$0") <server ZIP URL>"
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source "$SCRIPT_DIR/config.sh"

if [ $# -lt 1 ]; then
	echo -e "$USAGE"
	exit 1
fi

ZIP_URL="$1"
ZIP_FILENAME="$(echo "$ZIP_URL" | rev | cut -d '/' -f 1 | rev)"

if [ -d "$RUN_DIR_PATH" ]; then
	echo "Run directory '$RUN_DIR_HOST_PATH' already exists! Aborting"
	exit 2
fi

echo "Server ZIP filename: $ZIP_FILENAME"

echo "Downloading ZIP archive..."
wget -q "$ZIP_URL"

echo "Unpacking archive in directory ${RUN_DIR_HOST_PATH}..."
unzip -qo "$ZIP_FILENAME" -d "$RUN_DIR_HOST_PATH"

echo "Injecting run script..."
cp "./run_server.sh" "$RUN_DIR_PATH/"
chmod +x "$RUN_DIR_HOST_PATH/run_server.sh"
