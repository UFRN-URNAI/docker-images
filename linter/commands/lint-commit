#!/bin/bash

TARGET_BRANCH=${1:-"origin/master"}
TARGET_HEAD_COMMIT=$(git log "${TARGET_BRANCH}" --oneline --pretty=%H | head -1)

commitlint --config="${LINT_CONFIG_PATH}"/.commitlintrc --from="${TARGET_HEAD_COMMIT}"
