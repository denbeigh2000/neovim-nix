{ pkgs, lib, ... }:

{
  config = {
    plugins = {
      markdown-preview = {
        enable = lib.mkDefault true;
        previewOptions.sync_scroll_type = "relative";
      };

      treesitter.ensureInstalled = [
        "bash"
        "dockerfile"
        "ini"
        "jsonnet"
        "sql"
        "toml"
        "vim"
        "yaml"
      ];
    };

    extraPlugins = with pkgs.vimPlugins; [
      ansible-vim
      csv-vim
      nginx-vim
      vim-android
      vim-elixir
      vim-jsonnet
      vim-markdown
      vim-protobuf
      vim-puppet
      vim-toml
    ];

    extraPackages = with pkgs; [ jsonnet ];
  };
}
