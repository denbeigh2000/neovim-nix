{ lib, ... }:

let
  inherit (lib) mkDefault;
in
{
  config = {
    plugins = {
      lsp.servers.java-language-server.enable = mkDefault true;

      rooter.patterns = [ "pom.xml" ];
      treesitter.ensureInstalled = [ "java" ];
    };
  };
}
