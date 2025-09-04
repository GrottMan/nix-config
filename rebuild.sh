#!/bin/bash
# Exit immediately if a command exits with a non-zero status.
set -e

# Change to the nix-config directory
cd /home/tomas/nix-config || { echo "Failed to change directory."; exit 1; }

# Pull the latest changes from the remote repository
git pull

# Add all changes to the staging area
git add .

# Autoformat nix files using alejandra.
# If alejandra fails, the script will exit due to `set -e`.
echo "Formatting nix files..."
alejandra . || { echo "Formatting failed!"; exit 1; }

# Stage any changes made by the formatter
git add .

# Get current generation metadata for the commit message
# We use 'nixos-rebuild list-generations' to get a clean string for the commit message.
echo "NixOS Rebuilding..."
nixos-rebuild switch

# Clean up old generations, keeping the last 3
# nh clean all --keep 3

# Get current generation metadata again for the commit message, as the generation number might have changed after the rebuild
current_generation=$(nixos-rebuild list-generations | grep 'current' | sed 's/.*-> //')

# Commit the changes. The `|| true` prevents the script from exiting if there's nothing to commit.
echo "Committing changes..."

git commit -am "NixOS rebuild: $current_generation" || true

# Push the changes to the remote repository
git push

echo "Rebuild and push finished."
