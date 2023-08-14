{ pkgs, lib, ... }:

let
  inherit (lib) mkDefault;
in
{
  config = {
    plugins = {
      lsp.servers.gopls = {
        enable = mkDefault true;
        extraOptions.settings.plugins = {
          pycodestyle.enabled = mkDefault true;
          mypy.dmypy = mkDefault true;
        };
      };

      rooter.patterns = [ "go.mod" ];
      treesitter.ensureInstalled = [ "go" ];
    };

    extraPlugins = [ pkgs.vimPlugins.vim-go ];
  };
}

