#!/bin/bash

DIR=${1:-"."}
FILES=$(find-unignored-files "${DIR}" ".+\\.ya?ml$")

if [[ -z "${FILES}" ]]; then
  exit 0
fi

echo "${FILES}" | xargs yamllint -s -c "${LINT_CONFIG_PATH}"/.yamllint
