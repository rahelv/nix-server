{ config, ... }: {
  # grafana configuration ♡
  services.grafana = {
    enable = true;
    settings.server = {
      domain = "grafana.${config.domain}";
      port = 2342;
      addr = "127.0.0.1";
    };
    provision = {
      enable = true;
      datasources = {
        settings = {
          datasources = [
            {
              name = "Prometheus";
              type = "prometheus";
              access = "proxy";
              url = "http://127.0.0.1:${toString config.services.prometheus.port}";
              isDefault = true;
            }
          ];
        };
      };
    };
  };

  services.nginx.virtualHosts."grafana.${config.domain}" = {
    # enableACME = true;
    useACMEHost = "pumuckipla.net";
    forceSSL = true;
    locations."/" = {
      proxyPass = "http://127.0.0.1:${toString config.services.grafana.port}";
      recommendedProxySettings = true;
      proxyWebsockets = true;
    };
  };
}