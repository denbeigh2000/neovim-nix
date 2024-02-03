{ ... }:

# Discourage use of mouse and keyboard
{

  config = {
    # Discourage use of arrow navigation
    keymaps =
      let
        arrowKeys = [ "Up" "Down" "Left" "Right" ];
      in
      builtins.map
        (key: {
          # disable everywhere except command mode, because
          # vim keybindings aren't supported there (advice: use q: more)
          mode = [ "n" "i" "v" "o" "t" ];
          key = "<${key}>";
          action = "<NOP>";
        })
        arrowKeys;

    options.mouse = "";
  };
}
