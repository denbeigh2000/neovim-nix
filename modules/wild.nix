{ ... }:

# Let's get wild!!~
{
  config = {
    options = {
      # Likely paths I'll never want to appear in autocomplete
      wildignore = [
        "*android/*"
        "*target/*"
        "*bazel-*"
        "*coverage*"
        "*dist*"
        "*dist-server*"
        "*DS_Store*"
        "*node_modules*"
        "*platforms*"
        "*sass-cache*"
        "*.o"
        "*.obj"
        "*~"
        "*.pyc"
      ];

      # Enable tab completion
      wildmenu = true;
      wildmode = [ "longest:full" "list:full" ];
    };
  };
}
