#!/bin/bash
DIR=${1:-"."}
FILES=$(find-unignored-files "${DIR}" | xargs file --mime-type | grep "text/x-shellscript" | cut -d':' -f1)

if [[ -z "${FILES}" ]]; then
  exit 0
fi

echo "${FILES}" | xargs shellcheck
