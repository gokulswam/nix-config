{
  config,
  inputs,
  pkgs,
  nhModules,
  ...
}: {
  imports = [
    (import "${nhModules}/misc/stylix" {
      inherit config inputs pkgs;
      colorScheme = "vesper";
    })

    "${nhModules}/common.nix"
    "${nhModules}/desktop/gnome.nix"

    "${nhModules}/programs/ghostty.nix"
    "${nhModules}/programs/nixcord.nix"
    "${nhModules}/programs/vivaldi.nix"
    "${nhModules}/programs/vscode.nix"
  ];

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
