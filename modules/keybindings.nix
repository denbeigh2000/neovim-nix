{ ... }:

# Discourage use of mouse and keyboard
{

  config = {
    # Discourage use of arrow navigation
    # TODO: Mouse?
    maps =
      let
        unbindArrows = {
          "<Up>" = "<NOP>";
          "<Down>" = "<NOP>";
          "<Left>" = "<NOP>";
          "<Right>" = "<NOP>";
        };
      in
      {
        normalVisualOp = unbindArrows;
        insert = unbindArrows;
      };

    options.mouse = "";
  };
}
