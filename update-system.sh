#!/bin/sh
pushd ~/.dotfiles/system
nix flake update
popd
