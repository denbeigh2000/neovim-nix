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
      default = vimPlugins.is-vim;
      description = "Plugin to use for incsearch-vim";
    };
  };

  config = mkIf cfg.enable {
    extraPlugins = [ cfg.package ];

    keymaps.normal = [
      { key = "/"; action = "<Plug>(is-scroll-f)"; }
      { key = "?"; action = "<Plug>(is-scroll-b)"; }
    ];
  };
}

