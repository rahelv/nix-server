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
  sops.secrets."cloudflare/api-key" = { };
  sops.templates."cloudflare.env".content = ''
    CLOUDFLARE_EMAIL=${config.email}
    CLOUDFLARE_API_KEY=${config.sops.placeholder."cloudflare/api-key"}
  '';

  security.acme = {
    acceptTerms = true;
    # preliminarySelfsigned = false;
    defaults.email = config.email;
    certs."pumuckipla.net" = {
      dnsProvider = "cloudflare";
      environmentFile = config.sops.templates."cloudflare.env".path;
      group = "nginx";
      domain = "pumuckipla.net";
      extraDomainNames = [ "*.pumuckipla.net" ];
      reloadServices = [ "nginx" ];
    };
  };
}
