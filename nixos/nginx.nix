{ config, ... }: {
  imports = [
    ./zeus.nix
  ];
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts = {
      "notfound.${config.domain}" = {
        enableACME = true;
        forceSSL = true;
        root = ./notfound;
      };
      "_" = {
        globalRedirect = "notfound.${config.domain}";
      };
    };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = config.email;
  };
}
