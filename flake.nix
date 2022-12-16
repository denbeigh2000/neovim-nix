{
  description = "Denbeigh's customised Neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: {
    overlay = final: prev: {
      neovim = (prev.callPackage ./default.nix { });
    };
  } // flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
      neovim = pkgs.callPackage ./default.nix { };
    in
    {
      defaultPackage = neovim;

      packages.neovim = neovim;
    });
}
