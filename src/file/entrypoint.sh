#!/usr/bin/env bash

/usr/local/bin/caddy \
  file-server \
  --access-log \
  --browse \
  --reveal-symlinks \
  --listen="$GO64_DOCKER_CADDY_FILE__CFG_PORT" \
  --root='/srv'
