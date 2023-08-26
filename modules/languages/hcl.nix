{ pkgs, lib, ... }:

let
  inherit (lib) mkDefault;
in
{
  config = {
    plugins = {
      lsp.servers.terraformls.enable = true;

      rooter.patterns = [ "base.tf" ".terraform.lock.hcl" ".terraform" ];
      treesitter.ensureInstalled = [ "hcl" "terraform" ];
    };

    extraPlugins = [ pkgs.vimPlugins.vim-terraform ];
    extraPackages = with pkgs; [ terraform tflint ];
  };
}
