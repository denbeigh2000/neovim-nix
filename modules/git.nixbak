{ pkgs, lib, ... }:

let
  inherit (lib) mkDefault;
in

{
  config = {
    plugins = {
      fugitive.enable = mkDefault true;
      gitgutter.enable = mkDefault true;

      rooter.patterns = [ ".git/" ".gitignore" ];
      treesitter.ensureInstalled = [ "gitcommit" "gitignore" "git_config" ];
    };

    extraPlugins = with pkgs.vimPlugins; [ committia-vim vim-git ];
  };
}
