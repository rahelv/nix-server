{
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
