{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile
  home.packages = [
      pkgs.fzf
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}