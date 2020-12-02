#!/usr/bin/env bash

set -euo pipefail

if [ -z ${NOTE_DIR+x} ]; then
  echo "Error:"
  echo "  Note directory is not set."
  echo "  Please configure and export NOTE_DIR environment variable."
  exit 1
fi

function usage() {
  echo "Usage: note.sh [action]"
  echo
  echo "  actions:"
  echo "    grep [PATTERN]"
}

CURRENT_NOTE="$NOTE_DIR/$(date +'%Y-%m-%d').md"

mkdir -p "$NOTE_DIR"

if [ $# -eq 0 ];
then
    $EDITOR "$CURRENT_NOTE"
else
  case $1 in
    grep)
      grep -i -r --color "$2" "$NOTE_DIR"
      ;;
    *)
      usage
      ;;
  esac
fi
