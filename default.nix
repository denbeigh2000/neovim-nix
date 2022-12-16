{ neovim-unwrapped
, neovimUtils
, stdenv
, vimPlugins
, wrapNeovimUnstable
}:

let
  inherit (stdenv) hostPlatform;

  plugins = with vimPlugins; [
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

  config = neovimUtils.makeNeovimConfig {
    customRC = (builtins.readFile ./nvimrc);

    inherit plugins;

    vimAlias = true;
    vimdiffAlias = true;

    withPython3 = true;
    extraPython3Packages = (ps: with ps; [
      autopep8
      black
      pycodestyle
      pyflakes
      pylint
      python-lsp-server
      pylsp-mypy
      python-lsp-black
      mccabe
      rope
      yapf
    ]);

    packages.myVimPackage = {
      start = plugins;
    };
  };

in
  wrapNeovimUnstable neovim-unwrapped (config // {
    extraName = "-denbeigh";
    vimAlias = true;
    viAlias = true;
  })
