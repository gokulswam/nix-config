_: {
  services.openssh = {
    enable = true;
    ports = [22];

    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "yes";
      AllowUsers = null;
      UseDns = true;
      X11Forwarding = true;
    };
  };
}
