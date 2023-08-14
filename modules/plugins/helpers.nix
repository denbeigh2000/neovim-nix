{ lib, config, ... }:

{
  mkPlugin = {
    name,
    package,
    extraPlugins ? []
  }:

    let
      cfg = config.plugins.${name};

      inherit (lib) mkIf mkEnableOption mkPackageOption mkOption types;
    in
    {
      options.plugins.${name} = {
        enable = mkEnableOption "${name} plugin";
        package = mkPackageOption "${name}" package {};
      };

      config = mkIf cfg.enable {
        extraPlugins = [ cfg.package ] ++ extraPlugins;
      };
    };
}
