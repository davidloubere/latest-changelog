#!/bin/bash

LATEST_CHANGELOG=""
STARTED=0

while IFS= read -r line; do
  if [[ "$line" == "## "* && ${STARTED} == 0 ]]; then
    STARTED=1
    LATEST_CHANGELOG+="${line}\n"
    continue
  fi

  if [[ "$line" == "## "* && ${STARTED} == 1 ]]; then
    STARTED=1
    break
  fi

  if [[ ${STARTED} == 1 ]]; then
    LATEST_CHANGELOG+="${line}\n"
  fi
done < CHANGELOG.md

echo -e "${LATEST_CHANGELOG}"
