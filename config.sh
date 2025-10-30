#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

RUN_DIR="run"
RUN_DIR_CONTAINER_PATH="/opt/server"
JAVA_CONTAINER_IMAGE="amazoncorretto:25"

ROOT_DIR="$(realpath "$SCRIPT_DIR/..")"

RUN_DIR_HOST_PATH="$ROOT_DIR/$RUN_DIR"
