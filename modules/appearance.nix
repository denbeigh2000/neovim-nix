{ pkgs, ... }:

{
  config = {
    colorscheme = "gruvbox";
    colorschemes.gruvbox = {
      enable = true;
      # NOTE: Upstream appears to use gruvbox-nvim, which doesn't actually
      # respect the global variables set by the module(??)
      package = pkgs.vimPlugins.gruvbox;
      settings = {
        bold = true;
        italics = true;
        italicize_comments = true;
        italicize_strings = false;
        contrast_dark = "soft";
        contrast_light = "soft";
      };
    };

    plugins = {
      airline = {
        enable = true;
        extraConfig = {
          extensions = [ "tabline" ];
        };
        powerlineFonts = true;
        theme = "gruvbox";
      };

      cmp-treesitter.enable = true;
      nvim-cmp.sources = [{ name = "treesitter"; }];

      treesitter = {
        enable = true;
        indent = true;
      };
    };

    options = {
      background = "dark";
      syntax = "on";

      wrap = false;
      list = true;
      listchars = {
        precedes = "<";
        extends = ">";
        tab = ">.";
        trail = "!";
      };
      cursorline = true;
      showmatch = true;
      # TODO: language-specific overrides?
      textwidth = 79;
      titlestring = "%r%m %t %y - VIM: the only text editor";
      titlelen = 80;

      termguicolors = true;

      number = true;
      relativenumber = true;

      expandtab = true;
      shiftwidth = 4;
      tabstop = 4;
      softtabstop = 4;
      # smartindent = true;

      # Always show status bar for airline
      laststatus = 2;
    };

    extraPlugins = [ pkgs.vimPlugins.indentLine ];
  };
}
