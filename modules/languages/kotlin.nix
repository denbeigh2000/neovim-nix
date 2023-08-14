{ pkgs, lib, ... }:

let
  inherit (lib) mkDefault;
in
{
  config = {
    extraPlugins = [ pkgs.vimPlugins.kotlin-vim ];
  };
}
