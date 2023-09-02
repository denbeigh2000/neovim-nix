{ pkgs, lib, ... }:

let
  inherit (lib) mkDefault;
in
{
  config.plugins = {
    luasnip.enable = true;
    nvim-cmp =
      {
        enable = mkDefault true;
        preselect = "None";
        completion.keywordLength = 0;
        snippet.expand = "luasnip";
        sources = [
          { name = "luasnip"; }
          { name = "buffer"; }
          { name = "path"; }
        ];

        # https://old.reddit.com/r/neovim/comments/vr6kwr/help_to_make_ctrlnp_navigation_in_command_lsp/iet92xt/
        mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<C-n>" = ''
            cmp.mapping({
              c = function()
                if cmp.visible() then
                  cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                else
                  vim.api.nvim_feedkeys(t("<Down>"), "n", true)
                end
              end,
              i = function(fallback)
                if cmp.visible() then
                  cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                else
                  fallback()
                end
              end,
            })
          '';

          "<C-p>" = ''
            cmp.mapping({
              c = function()
                if cmp.visible() then
                  cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                else
                  vim.api.nvim_feedkeys(t("<Up>"), "n", true)
                end
              end,
              i = function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                else
                  fallback()
                end
              end,
            })
          '';
        };
      };
  };
}
