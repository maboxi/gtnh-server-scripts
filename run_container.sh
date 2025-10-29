#!/usr/bin/env bash

set -eu

USAGE="Usage: $(basename "$0") <RAM>"
source ./config.sh

if [ $# -lt 1 ]; then
	echo -e "$USAGE"
	exit 1
fi

RAM="$1"

echo -e "\
Starting container for server:
	RAM: $RAM
	Image: $JAVA_CONTAINER_IMAGE
	Host run directory: $RUN_DIR_HOST_PATH
	Container run directory: $RUN_DIR_CONTAINER_PATH
"

docker run \
	-v "$RUN_DIR_HOST_PATH":"$RUN_DIR_CONTAINER_PATH" \
	"$JAVA_CONTAINER_IMAGE" \
	bash "${RUN_DIR_CONTAINER_PATH}/run_server.sh" $@
