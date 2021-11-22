{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile
  home.packages = [
      pkgs.ls
      pkgs.fzf
      pkgs.bat
      pkgs.fd
      pkgs.ripgrep
      pkgs.ripgrep-all
      pkgs.gh
      pkgs.git
      pkgs.git-lfs
      pkgs.tldr
      # Count LoC
      pkgs.tokei
      # Nix language server
      pkgs.rnix-lsp
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Shawn Koh";
    userEmail = "shawn@shawnkoh.sg";
  };
}