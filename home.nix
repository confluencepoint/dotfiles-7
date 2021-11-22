{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile
  home.packages = [
    # Replacement for ls
    pkgs.exa
    pkgs.fzf
    # Replacement for cat
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
    pkgs.nixpkgs-fmt
    pkgs.pandoc
    # cd with learning abilities
    pkgs.jump
    pkgs.fish
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Shawn Koh";
    userEmail = "shawn@shawnkoh.sg";
  };
}
