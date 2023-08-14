{ lib, ... }:

let
  inherit (lib) mkDefault;
in
{
  config = {
    plugins = {
      rooter.patterns = [ "pom.xml" ];
      treesitter.ensureInstalled = [ "java" ];
    };
  };
}
