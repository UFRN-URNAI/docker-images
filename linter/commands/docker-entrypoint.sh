#!/bin/bash

ORIGIN_PATH="${LINT_CUSTOM_CONFIG_PATH}"
cp -r "${ORIGIN_PATH}"/. "${LINT_CONFIG_PATH}" 2>/dev/null

eval "${@}"
