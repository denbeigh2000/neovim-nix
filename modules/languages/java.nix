{ lib, ... }:

let
  inherit (lib) mkDefault;
in
{
  config = {
    plugins = {
      lsp.servers.java-language-server = {
        enable = mkDefault true;
        extraOptions.settings.plugins = {
          pycodestyle.enabled = mkDefault true;
          mypy.dmypy = mkDefault true;
        };
      };

      rooter.patterns = [ "pom.xml" ];
      treesitter.ensureInstalled = [ "java" ];
    };
  };
}

