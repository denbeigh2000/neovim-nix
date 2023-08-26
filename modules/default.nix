{ pkgs, lib, config, ... }:

{
  imports = [
    ./appearance.nix
    ./completion.nix
    ./git.nix
    ./keybindings.nix
    ./lsp.nix
    ./wild.nix

    ./languages/bazel.nix
    ./languages/c.nix
    ./languages/go.nix
    ./languages/hcl.nix
    ./languages/java.nix
    ./languages/kotlin.nix
    ./languages/nix.nix
    ./languages/python.nix
    ./languages/rust.nix
    ./languages/web.nix
    ./languages/misc.nix

    ./plugins/rooter
    ./plugins/fzf
    ./plugins/incsearch
  ];

  options = { };
  config = {
    globals.mapleader = " ";

    options = {
      # noinsert required for ncm2
      # completeopt = [ "menu" "preview" "noinsert" "menuonenoselect" ];

      # Required for operations modifying multiple buffers like rename.
      hidden = true;
    };

    # Enabled by default, but nice to explicitly have this
    editorconfig.enable = true;

    plugins = {
      fzf.enable = true;
      incsearch.enable = false;
      rooter.enable = true;
    };
  };
}
