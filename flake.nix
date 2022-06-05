{
  description = "Denbeigh's customised Neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: {
    overlay = final: prev: {
      neovim = (import ./default.nix {
        pkgs = prev;
      });
    };
  } // flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
      neovim = (import ./default.nix { inherit pkgs; });
    in
    {
      defaultPackage = neovim;

      packages.neovim = neovim;
    });
}
