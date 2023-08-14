{ pkgs, lib, ... }:

let
  inherit (lib) mkDefault;
in
{
  config = {
    plugins = {
      nix.enable = mkDefault true;
      lsp.servers.nixd = {
        enable = mkDefault true;
        settings.formatting.command = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt";
      };

      rooter.patterns = [ "flake.nix" ];
      treesitter.ensureInstalled = [ "nix" ];
    };
  };
}
