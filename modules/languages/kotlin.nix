{ pkgs, lib, ... }:

let
  inherit (lib) mkDefault;
in
{
  config = {
    plugins.lsp.servers.kotlin_language_server.enable = mkDefault true;
    extraPlugins = [ pkgs.vimPlugins.kotlin-vim ];
  };
}
