{ pkgs }:

let
  inherit (pkgs.stdenv) hostPlatform;

  # NOTE: vim-go currently broken on darwin due to https://github.com/NixOS/nixpkgs/issues/168984
  # Attempted using overlay solutions: https://github.com/sagikazarmark/go-bin-flake
  # but this does not seem to overwrite the version of golangci-lint used by vimPlugins.vim-go.

  extraPlugins = (
    if hostPlatform.isDarwin
    then [ ]
    else [ pkgs.vimPlugins.vim-go ]
  );

  plugins = with pkgs.vimPlugins; [
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
  ] ++ extraPlugins;
in
pkgs.neovim.override {
  configure = {
    customRC = (builtins.readFile ./nvimrc);

    packages.myVimPackage = {
      start = plugins;
    };
  };
}
