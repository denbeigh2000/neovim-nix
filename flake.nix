{
  description = "Denbeigh's customised Neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  outputs = { self, nixpkgs, flake-utils, nixvim }:
    let
      overlay = final: prev: {
        neovim = (import ./default.nix {
          inherit nixvim;
          pkgs = prev;
        });
      };
    in
    {
      overlays.default = overlay;
    } // flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            # NOTE: This is referred to by nixvim, and appears to not exist in
            # nixpkgs. Fix this if we ever start writing C#...
            (final: prev: { csharp-ls = null; })
            overlay
          ];
        };

      in
      {
        packages = with pkgs; {
          inherit neovim;
          default = neovim;
        };
      });
}
