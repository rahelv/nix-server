{
  networking = {
    hostName = "hades";
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 81 443 ];
    };
  };
}
