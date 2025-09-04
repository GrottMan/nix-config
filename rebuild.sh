#!/bin/bash
set -e
cd /home/tomas/nix-config
git pull
git add *
# Autoformat your nix files
alejandra  /home/tomas/nix-config/ &>/dev/null \
  || ( alejandra /home/tomas/nix-configs/ ; echo "formatting failed!" && exit 1)

echo "NixOS Rebuilding..."

sudo nixos-rebuild switch
# nh clean all --keep 3

# Get current generation metadata
current=$(nixos-rebuild list-generations | grep current)

git commit -am "$current"

echo "Rebuild finished"
 git push
# Commit all changes witih the generation metadata

