{
  description = "Denbeigh's customised Neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
    nixvim = {
      url = "github:nix-community/nixvim/nixos-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };

    denbeigh-ci = {
      url = "github:denbeigh2000/ci";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  outputs = { self, nixpkgs, flake-utils, nixvim, denbeigh-ci }:
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
        ci = denbeigh-ci.lib.mkCIConfig { inherit self pkgs; };

        packages = with pkgs; {
          ci-tool = denbeigh-ci.packages.${system}.tool;
          inherit neovim;
          default = neovim;
        };
      });
}
