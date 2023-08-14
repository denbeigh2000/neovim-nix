{ pkgs, lib, config, ... }:

let
  inherit (pkgs) vimPlugins;
  inherit (lib) mkEnableOption mkIf mkOption types;

  cfg = config.plugins.fzf;
in
{
  options.plugins.fzf = {
    enable = mkEnableOption "fzf-vim";
    package = mkOption {
      type = types.package;
      default = vimPlugins.fzf-vim;
      description = "Plugin to use for fzf-vim";
    };
  };

  config = mkIf cfg.enable {
    extraPlugins = [ vimPlugins.fzf-vim ];

    maps.normal = {
      "<leader>q" = { action = ":Rg<CR>"; };
      # "<leader>w" = { action = ":GFiles<CR>"; };
      "<leader>w" = { action = ":Files<CR>"; };
      "<leader>e" = { action = ":Buffers<CR>"; };
      "<leader>s" = { action = ":Lines<CR>"; };
      "<leader>d" = { action = ":BLines<CR>"; };
    };
  };
}
