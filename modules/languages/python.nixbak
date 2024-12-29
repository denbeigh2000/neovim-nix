{ lib, pkgs, ... }:

let
  inherit (lib) mkDefault;
in
{
  config = {
    plugins = {
      lsp.servers.pylsp = {
        enable = mkDefault true;
        settings.plugins = {
          autopep8.enabled = mkDefault false;
          black.enabled = mkDefault true;
          flake8.enabled = mkDefault false;
          isort.enabled = mkDefault true;
          pycodestyle.enabled = mkDefault false;
          pyflakes.enabled = mkDefault false;
          pylsp_mypy = {
            enabled = mkDefault true;
          };
          ruff = {
            enabled = mkDefault true;
            executable = mkDefault "${pkgs.ruff}/bin/ruff";
            lineLength = mkDefault 88;
            ignore = mkDefault [ "E501" ];
          };
        };
      };

      rooter.patterns = [ "pyproject.toml" "setup.py" "requirements.txt" ];
      treesitter.ensureInstalled = [ "python" ];
    };
  };
}
