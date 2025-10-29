#!/usr/bin/env bash

if [ ${BASH_SOURCE[0]} = ${0} ]; then
        echo "This script can only be sourced!"
	exit 1
fi

RUN_DIR="run"
RUN_DIR_CONTAINER_PATH="/opt/server"
JAVA_CONTAINER_IMAGE="amazoncorretto:25"

ROOT_DIR="$(realpath "$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/.." )"

RUN_DIR_HOST_PATH="$ROOT_DIR/$RUN_DIR"