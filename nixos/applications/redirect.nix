{ config, ... }: {
  # Redirections to zeus server
  services.nginx.virtualHosts = {
    "notfound.${config.domain}" = {
      useACMEHost = config.domain;
      forceSSL = true;
      root = ./notfound;
    };
    "_" = {
      globalRedirect = "notfound.${config.domain}";
    };

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
