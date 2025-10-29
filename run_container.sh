#!/usr/bin/env bash

set -eu

USAGE="Usage: $(basename "$0") <RAM>"
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source ./config.sh

RUN_DIR_HOST_PATH="$SCRIPT_DIR/$RUN_DIR"

if [ $# -lt 1 ]; then
	echo -e "$USAGE"
	exit 1
fi

RAM="$1"

cp "../run_server.sh" "$RUN_DIR_HOST_PATH"

echo -e "\
Starting container for server:
	RAM: $RAM
	Image: $JAVA_CONTAINER_IMAGE
"

docker run \
	-v "$RUN_DIR_HOST_PATH":"$RUN_DIR_CONTAINER_PATH" \
	"$JAVA_CONTAINER_IMAGE" \
	bash "${RUN_DIR_CONTAINER_PATH}/run_server.sh" $@
