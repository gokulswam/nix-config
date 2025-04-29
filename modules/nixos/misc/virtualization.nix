{
  pkgs,
  userConfig,
  ...
}: {
  services.spice-vdagentd.enable = true;
  users.groups.libvirtd.members = ["${userConfig.name}"];

  virtualisation = {
    libvirtd = {
      enable = true;

      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [pkgs.OVMFFull.fd];
      };
    };

    spiceUSBRedirection.enable = true;
  };
}
