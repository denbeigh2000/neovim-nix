{ lib, ... }:

let
  inherit (lib) mkDefault;
in

{
  config = {
    plugins = {
      lsp.servers.clangd.enable = mkDefault true;
      treesitter.ensureInstalled = [ "c" "cpp" ];
    };
  };
}
