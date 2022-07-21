Build the flake on the system with:

```
nixos-rebuild build .#nixvm
```

Where `.` means current directory and `nixvm` is the computer name (or system configuration for this system).

The `home-manager` configuration is separated (installed as standalone according to the docs). This is helpful otherwise nix creates another system wide generation for each change to the home profile, which is overkill.
Yet with a trick `home-manager` is integrated within the flake and the standalone command to build it is:

```
nix build .#homeManagerConfigurations.dario.activationPackage
```
