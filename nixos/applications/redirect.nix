{ config, ... }: {
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts = {
      "notfound.${config.domain}" = {
        # enableACME = true;
        useACMEHost = "pumuckipla.net";
        forceSSL = true;
        root = ./notfound;
      };
      "_" = {
        globalRedirect = "notfound.${config.domain}";
      };
    };
  };

  # Redirections to zeus server
  services.nginx.virtualHosts = {
    "grafana.qew.ch" = {
      enableACME = true;
      locations."/" = {
        proxyPass = "http://192.168.1.114:80";
        recommendedProxySettings = true;
      };
    };
    "vw.qew.ch" = {
      enableACME = true;
      # forceSSL = true;
      locations."/" = {
        proxyPass = "http://192.168.1.114:80";
        recommendedProxySettings = true;
      };
    };
    "cloud.qew.ch" = {
      enableACME = true;
      locations."/" = {
        proxyPass = "http://192.168.1.114:80";
        recommendedProxySettings = true;
      };
    };
  };
}
