#!/bin/sh

warning() {
  echo "\\e[1;33m$1"
}

if make lint; then
  warning "One or more linter checks are failing."
  exit 0
else
  warning "One or more linter checks are failing."
  warning "Please fix those checks before pushing your branch."
  exit 1
fi
