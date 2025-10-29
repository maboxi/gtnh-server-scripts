#!/usr/bin/env bash

set -eu

USAGE="Usage: $(basename "$0") <RAM>"
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

if [ $# -lt 1 ]; then
	echo -e "$USAGE"
	exit 1
fi

RAM="$1"

cd "$SCRIPT_DIR" || (echo "Error changing into run directory!" && exit 2)

echo -e "\
Starting server in directory '$SCRIPT_DIR':
	RAM: $RAM
"

echo ""

java "-Xms$RAM" "-Xmx$RAM" -Dfml.readTimeout=180 @java9args.txt -jar lwjgl3ify-forgePatches.jar nogui
