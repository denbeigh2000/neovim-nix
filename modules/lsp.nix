{ pkgs, lib, ... }:

let
  inherit (lib) mkDefault;
in
{
  config = {
    options.signcolumn = "yes";

    plugins = {
      lsp-format.enable = mkDefault true;
      lsp = {
        enable = mkDefault true;
        keymaps = {
          diagnostic = {
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            K = "signature_help";
            "<leader>R" = "references";
            "<leader>r" = "rename";
            "<leader>f" = "format";
            "<leader><leader>" = "definition";
            "<leader>z" = "code_action";
          };
        };
      };

      cmp-nvim-lsp.enable = mkDefault true;
      nvim-cmp.sources = [{ name = "nvim_lsp"; }];
    };
  };
}
