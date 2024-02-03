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

    keymaps = [
      { mode = "n"; key = "<leader>q"; action = ":Rg<CR>"; }
      # { mode = "n"; key = "<leader>w";  action = ":GFiles<CR>"; }
      { mode = "n"; key = "<leader>w"; action = ":Files<CR>"; }
      { mode = "n"; key = "<leader>e"; action = ":Buffers<CR>"; }
      { mode = "n"; key = "<leader>s"; action = ":Lines<CR>"; }
      { mode = "n"; key = "<leader>d"; action = ":BLines<CR>"; }
    ];
  };
}
