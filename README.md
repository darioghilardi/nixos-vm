# NixOS VM Dotfiles

Dotfiles for a NixOS VM.

## Setup

The goal of this project is to be able to setup a fully working NixOS VM with just two commands.  
The first command setup the NixOS system, while the second setup the user on the system with home-manager.

Here are the steps:
- Install NixOS
- Download the code from this repository to the `~/.dotfiles` folder on your system.
- Enter the `~/.dotfiles` folder
- Run `sudo nixos-rebuild switch --flake './system#nixos'`
- Run `nix run home-mananger --no-write-lock-file -- switch --flake './users#nixos'`

## Usage

There are some operations you might want to do while using the project.

### Update the system configuration

The command to update the system configuration after making changes is `sudo nixos-rebuild switch --flake './system#nixos'`.  
Unfortunately that command is verbose and must be run from the `~/.dotfiles` folder.

To save you from the pain an alias that can be used from any directory is available: `apply_sys`.

### Update the user configuration

The command to update the user configuration after making changes is `nix run home-manager --no-write-lock-file -- switch --flake './users#nixos'`.  
Since this is also verbose and must be run from the `~/.dotfiles` folder an alias that can be used from any directory is available: `apply_user`.

### Update the flake lockfiles

The `flake.nix` file in the `system/` folder and the `flake.nix` file in the `users/` folder define the system and user configurations to apply.  
For both files there is a corresponding `flake.lock` file which has the purpose of locking the flake inputs to a specific git SHA.

To update the version of the flake inputs for the system flake run `update_sys`, to do it for the user flake run `update_user`.  
Those commands will change the SHA in the flakes lockfiles. To apply the updates run either `apply_sys` or `apply_user`.

### Note

The `home-manager` configuration is separated from the system configuration (home-manager is installed standalone according to the docs). This is useful to avoid Nix to create another system wide generation for each change to the home profile, which is frankly overkill.
```
