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
        system = "x86_64-darwin";
        homeDirectory = "/Users/shawnkoh";
        username = "shawnkoh";
        configuration.imports = [ ./home.nix ];
        stateVersion = "21.11";
      };
    };
  };
}
