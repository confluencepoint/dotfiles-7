{
  description = "shawnkoh/dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: {
    homeConfigurations = {
      shawnkoh = inputs.home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux";
        homeDirectory = "/home/shawnkoh";
        username = "shawnkoh";
        configuration.imports = [ ./home.nix ];
        # Note: This was moved from home.nix
        # Home Manager needs a bit of information about you and the
        # paths it should manage.
        home.username = "shawnkoh";
        home.homeDirectory = "/home/shawnkoh";

        # Note: This was moved from home.nix
        # This value determines the Home Manager release that your
        # configuration is compatible with. This helps avoid breakage
        # when a new Home Manager release introduces backwards
        # incompatible changes.
        #
        # You can update Home Manager without changing this value. See
        # the Home Manager release notes for a list of state version
        # changes in each release.
        home.stateVersion = "21.11";
      };
    };
  };
}