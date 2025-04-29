{
  inputs,
  hostname,
  nixosModules,
  ...
}: {
  imports = [
    inputs.determinate.nixosModules.default

    "${nixosModules}/common.nix"
    "${nixosModules}/misc/wsl.nix"
    "${nixosModules}/services/vscode-server.nix"
  ];

  networking.hostName = hostname;
  nixpkgs.hostPlatform = "x86_64-linux";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  system.stateVersion = "24.11";
}
