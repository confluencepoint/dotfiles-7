{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile
  home.packages = [
    pkgs.fish
    # pretty prompt
    pkgs.starship

    # git utilities
    pkgs.git
    pkgs.git-lfs
    pkgs.gh

    # shell utilities
    pkgs.fzf
    # Replacement for ls
    pkgs.exa
    # Replacement for cat
    pkgs.bat
    pkgs.fd
    pkgs.ripgrep
    pkgs.ripgrep-all
    # Count LoC
    pkgs.tokei
    # cd with learning abilities
    pkgs.jump

    # shell reference
    pkgs.tldr

    # Nix language server
    pkgs.rnix-lsp
    pkgs.nixpkgs-fmt
    pkgs.pandoc
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
    enableFishIntegration = true;
  };

  programs.fish = {
    enable = true;
  };

  # programs.fish.plugins = [{
  #   name = "fzf.fish";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "PatrickF1";
  #     repo = "fzf.fish";
  #     rev = "176c8465b0fad2d5c30aacafff6eb5accb7e3826";
  #     sha256 = "sha256-qQ+mQQsPH9WvdgmLVoY6w+pYUyk062BKPxvKbr93rZo=";
  #   };
  # }];
}
