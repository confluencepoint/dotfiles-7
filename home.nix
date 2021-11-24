{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile
  home.packages = [
    pkgs.fd
    pkgs.ripgrep
    pkgs.ripgrep-all
    # Count LoC
    pkgs.tokei
    # Replacement for ps
    pkgs.procs
    pkgs.sd

    # shell reference
    pkgs.tealdeer

    # Nix language server
    pkgs.rnix-lsp
    pkgs.nixpkgs-fmt

    pkgs.pandoc

    pkgs.bat-extras.batdiff
    pkgs.bat-extras.batgrep
    pkgs.bat-extras.batman
    # Unable to install due to libcxx being marked as broken.
    # TODO: Revisit this after installing nix-darwin
    # pkgs.bat-extras.prettybat

    # Code Formatters to support prettybat
    # Python
    # pkgs.black
    # Rust
    # pkgs.rustfmt
    # Web
    # pkgs.nodePackages.prettier
  ];

  programs.fish = {
    enable = true;
    # Temporary workaround
    # https://alexpearce.me/2021/07/managing-dotfiles-with-nix/
    plugins = [
      {
        name = "nix-env";
        src = pkgs.fetchFromGitHub {
          owner = "lilyball";
          repo = "nix-env.fish";
          rev = "00c6cc762427efe08ac0bd0d1b1d12048d3ca727";
          sha256 = "1hrl22dd0aaszdanhvddvqz3aq40jp9zi2zn0v1hjnf7fx4bgpma";
        };
      }
      {
        name = "iterm2-shell-integration";
        src = ./config/fish/iterm2_shell_integration;
      }
    ];
    interactiveShellInit = ''iterm2_shell_integration'';

    shellAliases = {
      cat = "bat";
      cp = "cp -i";
      mkdir = "mkdir -p";
      mv = "mv -i";
      rm = "rm -i";
      ps = "procs";
    };

    functions = {
      fish_greeting = {
        description = "Greeting to show when starting a fish shell";
        body = "";
      };
      renovate = {
        description = "Rebuild nix home";
        body = ''
          nix build ~/.config/nixpkgs#homeConfigurations.shawnkoh.activation-script &&
          ~/.config/nixpkgs/result/activate
        '';
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Intelligent cd.
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.gpg = {
    enable = true;
  };

  programs.ssh = {
    enable = true;
    extraConfig = "
      AddKeysToAgent yes
      UseKeyChain yes
      IdentityFile ~/.ssh/id_ed25519
    ";
  };

  programs.git = {
    enable = true;
    userName = "Shawn Koh";
    userEmail = "shawn@shawnkoh.sg";
    ignores = [
      ".DS_Store"
    ];

    lfs = {
      enable = true;
    };

    signing = {
      key = null;
      signByDefault = true;
    };
  };

  # Github CLI
  programs.gh = {
    enable = true;
  };

  # Pipeable fuzzy search
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  # Replacement for cat
  programs.bat = {
    enable = true;
  };

  # Replacement for ls
  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  # Replacement for vim
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
}
