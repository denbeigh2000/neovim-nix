{ pkgs, lib, ... }:

let
  inherit (lib) mkDefault;
in
{
  config = {
    plugins.lsp.servers.kotlin-language-server.enable = mkDefault true;
    extraPlugins = [ pkgs.vimPlugins.kotlin-vim ];
  };
}
