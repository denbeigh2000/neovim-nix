{ lib, ... }:

let
  inherit (lib) mkDefault;
in
{
  config = {
    globals.rust_recommended_style = 0;

    plugins = {
      lsp.servers.rust-analyzer = {
        enable = mkDefault true;
        settings = {
          cargo.features = "all";
          check = {
            command = "clippy";
            features = "all";
          };
        };

        installCargo = false;
        installRustc = false;
      };

      rooter.patterns = [ "Cargo.toml" "Cargo.lock" ];
      treesitter.ensureInstalled = [ "rust" ];
    };
  };
}
