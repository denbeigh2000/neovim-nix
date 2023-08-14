{ pkgs, lib, ... }:

let
  inherit (lib) mkDefault;
in
{
  config = {
    plugins = {
      nix.enable = mkDefault true;
      lsp.servers.rnix-lsp.enable = mkDefault true;

      rooter.patterns = [ "flake.nix" ];
      treesitter.ensureInstalled = [ "nix" ];
    };
  };
}
