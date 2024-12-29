{ pkgs, lib, ... }:

let
  inherit (lib) mkDefault;
  inherit (pkgs) opentofu tflint;
in
{
  config = {
    plugins = {
      lsp.servers.terraformls = {
        enable = true;
        extraOptions.path = "${opentofu}";
      };

      rooter.patterns = [ "base.tf" ".terraform.lock.hcl" ".terraform" ];
      treesitter.ensureInstalled = [ "hcl" "terraform" ];
    };

    extraPlugins = [ pkgs.vimPlugins.vim-terraform ];
    extraPackages = [ tflint ];
  };
}
