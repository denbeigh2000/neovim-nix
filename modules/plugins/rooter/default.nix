{ pkgs, lib, config, ... }:

let
  inherit (pkgs) vimPlugins;
  inherit (lib) mkEnableOption mkIf mkOption types;

  cfg = config.plugins.rooter;
in
{
  options.plugins.rooter = {
    enable = mkEnableOption "vim-rooter";
    package = mkOption {
      description = "Plugin to use for vim-rooter";
      type = types.package;
      default = vimPlugins.vim-rooter;
    };

    patterns = mkOption {
      description = "File patterns for vim-rooter to consider roots";
      type = types.listOf types.str;
      default = [ ];
    };
  };
  config = mkIf cfg.enable {
    extraPlugins = [ cfg.package ];

    globals = mkIf (cfg.patterns != [ ]) {
      rooter_patterns = cfg.patterns;
    };
  };
}
