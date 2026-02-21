{
  description = "Jeroen's NixOS configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-virtualbox-726.url = "github:NixOS/nixpkgs/56180e04fcbbb3be998a09a2a75e4ba2e860d48f";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, nixpkgs-virtualbox-726, home-manager, rust-overlay, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        pkgs-virtualbox-726 = nixpkgs-virtualbox-726.legacyPackages.${system};
      };
      modules = [
        ({ pkgs, ... }: { nixpkgs.overlays = [ rust-overlay.overlays.default ]; })
        ./configuration.nix
      ];
    };
    homeConfigurations.jeroen = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [ ./home.nix ];
    };
  };
}
