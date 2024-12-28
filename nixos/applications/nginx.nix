{ config, ... }: {
  imports = [
    ./redirect.nix
    ./variables.nix
    ./services
  ];
  sops.secrets."cloudflare/api-key" = { };
  sops.templates."cloudflare.env".content = ''
    CLOUDFLARE_EMAIL=${config.email}
    CLOUDFLARE_DNS_API_TOKEN=${config.sops.placeholder."cloudflare/api-key"}
  '';

  security.acme = {
    acceptTerms = true;
    defaults.email = config.email;
    certs."${config.domain}" = {
      dnsProvider = "cloudflare";
      environmentFile = config.sops.templates."cloudflare.env".path;
      group = "nginx";
      domain = config.domain;
      extraDomainNames = [ "*.${config.domain}" ];
      reloadServices = [ "nginx" ];
    };
  };
}
