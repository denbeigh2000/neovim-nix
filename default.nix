{ pkgs ? import <nixpkgs> {} }:

let
  plugins = with pkgs.vimPlugins; [
    LanguageClient-neovim
    nvim-yarp
    ncm2
    vim-gitgutter
    vim-rooter
    incsearch-vim
    fzf-vim
    suda-vim
    committia-vim
    vim-fugitive
    vim-git
    vim-airline
    taglist-vim
    indentLine
    vim-toml
    csv-vim
    vim-nix
    ansible-vim
    vim-markdown
    vim-puppet
    arcanist-vim
    vim-protobuf
    vim-go
    vim-jsx-typescript
    vim-javascript
    gruvbox
  ];
in
  pkgs.neovim.override {
    configure = {
      customRC = (builtins.readFile ./nvimrc);

      packages.myVimPackage = {
        start = plugins;
      };
    };
  }
