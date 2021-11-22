{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile
  home.packages = [
      pkgs.fzf
      pkgs.bat
      pkgs.fd
      pkgs.ripgrep
      pkgs.tldr
      pkgs.gh
      pkgs.git-lfs
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Shawn Koh";
    userEmail = "shawn@shawnkoh.sg";
  };
}