#!/bin/sh
pushd ~/.dotfiles
nix run home-manager --no-write-lock-file -- switch --flake './users#nixos'
popd
