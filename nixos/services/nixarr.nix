{ config, ... }: {
  nixarr = {
    enable = true;
    mediaDir = "${config.dataDir}/media";
    stateDir = "${config.dataDir}/media/.state/nixarr";

    vpn = {
      enable = true;
      #TODO:put into sops
      wgConf = "/wg.conf";
    };

    jellyfin = {
      enable = true;
      expose.https = {
        enable = true;
        domainName = "jelly.${config.domain}";
        acmeMail = config.email;
      };
    };

    transmission = {
      enable = true;
      vpn.enable = true;
      openFirewall = true;
      peerPort = 23182;
      flood.enable = true;
    };

    prowlarr.enable = true;
    prowlarr.openFirewall = true;
    radarr.enable = true;
    radarr.openFirewall = true;
    sonarr.enable = true;
    sonarr.openFirewall = true;
  };
  services.nginx.virtualHosts."prowlarr.${config.domain}" = {
    enableACME = true;
    forceSSL = true;
    locations."/" = {
      proxyPass = "http://127.0.0.1:9696";
      recommendedProxySettings = true;
    };
  };
  services.nginx.virtualHosts."radarr.${config.domain}" = {
    enableACME = true;
    forceSSL = true;
    locations."/" = {
      proxyPass = "http://127.0.0.1:7878";
      recommendedProxySettings = true;
    };
  };
  services.nginx.virtualHosts."sonarr.${config.domain}" = {
    enableACME = true;
    forceSSL = true;
    locations."/" = {
      proxyPass = "http://127.0.0.1:8989";
      recommendedProxySettings = true;
    };
  };
  services.nginx.virtualHosts."transmission.${config.domain}" = {
    enableACME = true;
    forceSSL = true;
    basicAuth = { user = "ephiischdoof"; password = "hehehe"; };
    locations."/" = {
      proxyPass = "http://127.0.0.1:9091";
      recommendedProxySettings = true;
      proxyWebsockets = true;
    };
  };
}
