#!/usr/bin/env bash

/usr/local/bin/caddy \
  file-server \
  --access-log \
  --browse \
  --reveal-symlinks \
  --listen="$MY_CADDY_CFG_PORT" \
  --root='/srv'
