{ lib, pkgs, ... }:


let
  inherit (lib) mkDefault;
in
{
  config = {
    plugins = {
      lsp.servers.ocamllsp = {
        enable = mkDefault true;
        package = mkDefault pkgs.ocamlPackages.ocaml-lsp;
      };

      rooter.patterns = [ "dune-project" ];
      treesitter.settings.ensure_installed = [ "ocaml" ];
    };
  };
}

