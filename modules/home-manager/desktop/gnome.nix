{pkgs, ...}: {
  dconf = {
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;

        enabled-extensions = with pkgs.gnomeExtensions; [
          appindicator.extensionUuid
          caffeine.extensionUuid
          dash-to-panel.extensionUuid
          pano.extensionUuid
          rounded-window-corners-reborn.extensionUuid
          tiling-assistant.extensionUuid
          vertical-workspaces.extensionUuid
        ];
      };
    };
  };

  home.packages = pkgs.lib.attrValues {
    inherit
      (pkgs)
      fractal
      gnome-boxes
      ;
  };
}
