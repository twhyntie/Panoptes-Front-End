#!/usr/bin/env bash

source "$(dirname "$0")/config.sh"

pids=""

[[ -f "$DEV_DIR/$OUT_JS" ]] && rm "$DEV_DIR/$OUT_JS"

./node_modules/.bin/webpack \
  --watch \
  "$SRC_JS" \
  "$DEV_DIR/$OUT_JS" \
  & pids="$pids $!"

[[ -f "$DEV_DIR/$OUT_CSS" ]] && rm "$DEV_DIR/$OUT_CSS"

./node_modules/.bin/stylus \
  --watch \
  --sourcemap-inline \
  --use nib \
  --import nib \
  --out "$DEV_DIR" \
  "$SRC_CSS" \
  & pids="$pids $!"

./node_modules/.bin/static \
  --port "$PORT" \
  --cache "no-cache, must-revalidate" \
  "$DEV_DIR" \
  & pids="$pids $!"

trap 'kill -HUP $pids' INT TERM HUP

wait
