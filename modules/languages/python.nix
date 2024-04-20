{ lib, ... }:

let
  inherit (lib) mkDefault;
in
{
  config = {
    plugins = {
      lsp.servers.pylsp = {
        enable = mkDefault true;
        settings.plugins = {
          black.enabled = mkDefault true;
          isort.enabled = mkDefault true;
          ruff.enabled = mkDefault true;
          pycodestyle.enabled = mkDefault true;
          # pyflakes.enabled = mkDefault true;
          pylsp_mypy = {
            enabled = mkDefault true;
            dmypy = mkDefault true;
          };
        };
      };

      rooter.patterns = [ "pyproject.toml" "setup.py" "requirements.txt" ];
      treesitter.ensureInstalled = [ "python" ];
    };
  };
}
