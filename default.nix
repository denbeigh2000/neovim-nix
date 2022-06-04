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
    vim-jsx-typescript
    vim-javascript
    gruvbox
    editorconfig-vim
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
