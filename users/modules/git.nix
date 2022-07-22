{ config, pkgs, lib, ... }:
let
  env = (builtins.fromTOML (builtins.readFile ../../config.toml));
in {
  programs.git.enable = true;

  programs.git.userName = env.git.name;
  programs.git.userEmail = env.git.email;
  programs.git.ignores = [ ".DS_Store" ];
  programs.git.extraConfig = {
    color.ui = "auto";
    init = { defaultBranch = "master"; };
  };

  # Enhanced diffs
  programs.git.delta.enable = true;

  # GitHub CLI
  programs.gh.enable = true;
  programs.gh.settings = {
    git_protocol = "https";
    prompt = "enabled";
  };
}
