{
  inputs,
  hostname,
  nixosModules,
  pkgs,
  ...
}: {
  imports = [
    inputs.disko.nixosModules.disko
    inputs.vscode-server.nixosModules.default

    ./disk-config.nix
    ./hardware-configuration.nix
    "${nixosModules}/common"
    "${nixosModules}/services/openssh"
    "${nixosModules}/services/vscode-server"
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = hostname;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  system.stateVersion = "24.11";

  users.defaultUserShell = pkgs.lib.mkForce pkgs.bash;
}
