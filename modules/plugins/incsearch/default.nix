{ pkgs, lib, config, ... }:

let
  inherit (pkgs) vimPlugins;
  inherit (lib) mkEnableOption mkIf mkOption types;

  cfg = config.plugins.incsearch;
in
{
  options.plugins.incsearch = {
    enable = mkEnableOption "incsearch-vim";
    package = mkOption {
      type = types.package;
      default = vimPlugins.incsearch-vim;
      description = "Plugin to use for incsearch-vim";
    };
  };

  config = mkIf cfg.enable {
    extraPlugins = [ vimPlugins.incsearch-vim ];

    maps.normal = {
      "/" = "<Plug>(incsearch-forward)";
      "?" = "<Plug>(incsearch-backward)";
    };
  };
}

