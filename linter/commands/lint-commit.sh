#!/bin/bash

TARGET_BRANCH=${1:-"main"}
TARGET_HEAD_COMMIT=$(git rev-parse "${TARGET_BRANCH}")

commitlint --config="${LINT_CONFIG_PATH}"/.commitlintrc --from="${TARGET_HEAD_COMMIT}"
