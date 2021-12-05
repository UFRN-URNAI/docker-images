#!/bin/bash

DIR=${1:-"."}
FILES=$(find-unignored-files "${DIR}" ".+\\.py$")

if [[ -z "${FILES}" ]]; then
  exit 0
fi

echo "${FILES}" | xargs flake8 --config="${LINT_CONFIG_PATH}"/.flake8
