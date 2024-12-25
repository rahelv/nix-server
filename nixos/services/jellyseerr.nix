{ config, ... }: {
  services.jellyseerr = {
    enable = true;
    openFirewall = true;
    port = 5555;
  };

  services.nginx.virtualHosts."js.${config.domain}" = {
    enableACME = true;
    forceSSL = true;
    locations."/" = {
      proxyPass = "http://127.0.0.1:${toString config.services.jellyseerr.port}";
      recommendedProxySettings = true;
    };
  };
}
