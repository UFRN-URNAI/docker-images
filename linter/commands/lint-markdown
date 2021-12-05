#!/bin/bash

DIR=${1:-"."}
FILES=$(find-unignored-files "${DIR}" ".+\\.\\(md\\|markdown\\)$")

if [[ -z "${FILES}" ]]; then
  exit 0
fi

echo "${FILES}" | xargs markdownlint -c "${LINT_CONFIG_PATH}"/.markdownlintrc
