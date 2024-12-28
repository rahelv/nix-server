{ config, ... }: {
  services.homepage-dashboard = {
    enable = true;
    listenPort = 8082;
    settings = {
      background = {
        image = "https://i.redd.it/vvq3pmz35pea1.jpg";
        blur = "md";

      };
    };
    services = [
      {
        "Media" =
          [
            {
              "Jellyfin" = {
                href = "https://jelly.${config.domain}";
                icon = "jellyfin";
              };
            }
            {
              "Radarr" = {
                href = "https://radarr.${config.domain}";
                icon = "radarr";
              };
            }
            {
              "Prowlarr" = {
                href = "https://prowlarr.${config.domain}";
                icon = "prowlarr";
              };
            }
          ];

      }
      {
        "Monitoring" =
          [
            {
              "Grafana" = {
                href = "https://grafana.${config.domain}";
                icon = "grafana";
              };
            }
          ];

      }

    ];
  };
  services.nginx.virtualHosts."${config.domain}" = {
    useACMEHost = config.domain;
    forceSSL = true;
    locations."/" = {
      proxyPass = "http://127.0.0.1:${toString config.services.homepage-dashboard.listenPort}";
      recommendedProxySettings = true;
      proxyWebsockets = true;
    };
  };

}
