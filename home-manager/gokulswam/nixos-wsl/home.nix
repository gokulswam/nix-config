{
  config,
  inputs,
  outputs,
  lib,
  pkgs,
  nhModules,
  ...
}: {
  imports = [
    (import "${nhModules}/misc/stylix" {
      inherit config inputs pkgs;
      colorScheme = "houseki";
    })

    "${nhModules}/common.nix"
  ];

  programs = {
    bash = {
      enable = true;
      enableVteIntegration = true;
      initExtra = ''eval "$(${pkgs.starship}/bin/starship init bash)"'';
    };

    home-manager.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
