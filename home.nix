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
    pkgs.starship
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Shawn Koh";
    userEmail = "shawn@shawnkoh.sg";
  };

  programs.starship = {
    enable = true;
  };

  programs.fish.enable = {
    enable = true;
  };

  programs.fish.plugins = [{
    name = "fzf.fish";
    src = pkgs.fetchFromGitHub {
      owner = "PatrickF1";
      repo = "https://github.com/PatrickF1/fzf.fish";
      rev = "176c8465b0fad2d5c30aacafff6eb5accb7e3826";
      sha256 = pkgs.lib.fakeSha256;
    };
  }];
}
