{config}: {
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        padding = {
          x = 40;
          y = 40;
        };

        dynamic_padding = true;
        decorations_theme_variant = "Dark";
      };

      font = {
        size = 8;
        builtin_box_drawing = true;
      };

      cursor.style = {
        shape = "Beam";
        blinking = "On";
      };

      colors = with config.lib.stylix.colors; {
        primary = {
          background = "0x${base00}";
          foreground = "0x${base06}";
        };

        cursor = {cursor = "0x${base07}";};

        normal = {
          black = "0x${base01}";
          red = "0x${base0A}";
          green = "0x${base0D}";
          yellow = "0x${base0E}";
          blue = "0x${base0B}";
          magenta = "0x${base0C}";
          cyan = "0x${base08}";
          white = "0x${base06}";
        };

        bright = {
          black = "0x${base02}";
          red = "0x${base0A}";
          green = "0x${base0D}";
          yellow = "0x${base0E}";
          blue = "0x${base0B}";
          magenta = "0x${base0C}";
          cyan = "0x${base08}";
          white = "0x${base06}";
        };
      };
    };
  };
}
