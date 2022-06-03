{
  description = "Denbeigh's customised Neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        neovim = (import ./default.nix {
          pkgs = nixpkgs.legacyPackages."${system}";
        });
      in
      {
        packages.neovim = neovim;

        defaultPackage = neovim;
      });
}
