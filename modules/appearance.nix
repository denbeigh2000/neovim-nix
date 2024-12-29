{ pkgs, ... }:

{
  config = {
    colorscheme = "gruvbox";
    colorschemes.gruvbox = {
      enable = true;
      settings = {
        bold = true;
        italics = true;
        italicize_comments = true;
        italicize_strings = false;
        contrast = "soft";
        background = "dark";
        terminal_colors = true;
      };
    };

    plugins = {
      airline = {
        enable = true;
        settings = {
          extensions = [ "tabline" ];
          powerline_fonts = 1;
          theme = "base16_gruvbox_dark_soft";
        };
      };

      cmp-treesitter.enable = true;
      cmp.settings.sources = [{ name = "treesitter"; }];

      treesitter = {
        enable = true;
        settings.indent.enable = true;
      };
    };

    opts = {
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

    extraPlugins = with pkgs.vimPlugins; [ indentLine vim-airline-themes ];
  };
}
