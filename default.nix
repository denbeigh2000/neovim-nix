{ neovim
, stdenv
, vimPlugins
}:

let
  inherit (stdenv) hostPlatform;

  plugins = with vimPlugins; [
    LanguageClient-neovim
    ansible-vim
    arcanist-vim
    committia-vim
    csv-vim
    editorconfig-vim
    fzf-vim
    gruvbox
    incsearch-vim
    indentLine
    kotlin-vim
    markdown-preview-nvim
    ncm2
    nginx-vim
    nvim-yarp
    suda-vim
    taglist-vim
    typescript-vim
    vim-airline
    vim-android
    vim-elixir
    vim-fugitive
    vim-git
    vim-gitgutter
    vim-go
    vim-javascript
    vim-jsonnet
    vim-jsx-typescript
    vim-markdown
    vim-nix
    vim-protobuf
    vim-puppet
    vim-rooter
    vim-terraform
    vim-toml
    vim-vsnip
    vim-vsnip-integ
  ];
in
neovim.override {
  configure = {
    customRC = (builtins.readFile ./nvimrc);

    packages.myVimPackage = {
      start = plugins;
    };
  };
}
