{
  description = "Jeroen's NixOS configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-virtualbox-726.url = "github:NixOS/nixpkgs/56180e04fcbbb3be998a09a2a75e4ba2e860d48f";
    nixpkgs-duckdb-144.url = "github:NixOS/nixpkgs/2fc6539b";
    #  nixpkgs-dust-121.url = "github:NixOS/nixpkgs/6430162b6ac7c70badd9af9cbfecf5dc31b52eb3";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-esp-dev = {
      url = "github:mirrexagon/nixpkgs-esp-dev";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-virtualbox-726,
      nixpkgs-duckdb-144,
      home-manager,
      rust-overlay,
      nixvim,
      # nixpkgs-dust-121,
      nixpkgs-esp-dev,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          pkgs-virtualbox-726 = nixpkgs-virtualbox-726.legacyPackages.${system};
          pkgs-esp-idf = nixpkgs-esp-dev.packages.${system};
          pkgs-duckdb-144 = nixpkgs-duckdb-144.legacyPackages.${system};
          # pkgs-dust-121 = nixpkgs-dust-121.legacyPackages.${system};
        };
        modules = [
          (
            { pkgs, ... }:
            {
              nixpkgs.overlays = [ rust-overlay.overlays.default ];
            }
          )
          ./configuration.nix
        ];
      };
      homeConfigurations.jeroen = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          nixvim.homeModules.nixvim
          ./home.nix
        ];
      };
    };
}
