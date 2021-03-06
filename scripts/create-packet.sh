#!/usr/bin/env bash

set -euxo pipefail

# Credential setup

if [ ! -f ./secrets/graylog-creds.nix ]; then
  nix-shell ./scripts/gen-graylog-creds.nix
fi

# NixOps setup

nixops destroy || true
nixops delete || true
nixops create ./deployments/jormungandr-performance-packet.nix -I nixpkgs=./nix
nixops set-args --arg globals 'import ./globals.nix'
# nixops deploy
