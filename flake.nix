{
  description = "Denbeigh's customised Neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
  let
    overlay = final: prev: {
      neovim = (prev.callPackage ./default.nix { });
    };
  in
  {
    overlays.default = overlay;
  } // flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ overlay ];
      };
    in
    {
      packages = with pkgs; {
        inherit neovim;
        default = neovim;
      };
    });
}
