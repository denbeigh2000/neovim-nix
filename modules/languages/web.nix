{ pkgs, lib, ... }:

let
  inherit (lib) mkDefault;
in
{
  config = {
    plugins = {
      lsp.servers.tsserver.enable = mkDefault true;
      rooter.patterns = [
        "package.json"
        "package-lock.json"
        "yarn.lock"
        "pnpm-lock.yaml"
      ];
      treesitter.ensureInstalled = [
        "css"
        "html"
        "javascript"
        "tsx"
        "typescript"
      ];
    };

    extraPlugins = with pkgs.vimPlugins; [
      typescript-vim
      vim-javascript
      vim-jsx-typescript
    ];
  };
}
