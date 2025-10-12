{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    #nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations = {
      helios = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit system;
        };
        modules = [
        ./hosts/helios/configuration.nix
        ];
      };
    };
  };
}
