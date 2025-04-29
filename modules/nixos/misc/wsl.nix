{
  inputs,
  userConfig,
  ...
}: {
  imports = [
    inputs.nixos-wsl.nixosModules.wsl
  ];

  wsl = {
    enable = true;

    wslConf = {
      automount.root = "/mnt";
      interop.appendWindowsPath = false;
      network.generateHosts = false;
    };

    defaultUser = "${userConfig.name}";
    startMenuLaunchers = true;
    docker-desktop.enable = false;
  };
}
