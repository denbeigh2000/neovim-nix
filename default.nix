{ pkgs, nixvim }:

let
  inherit (pkgs.stdenvNoCC.hostPlatform) system;
  nixvim' = nixvim.legacyPackages.${system};
in
nixvim'.makeNixvimWithModule {
  inherit pkgs;
  module = import ./modules;
}
