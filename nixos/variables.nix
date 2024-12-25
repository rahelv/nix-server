{ lib, ... }:
{
  options = with lib; with types; {
    domain = mkOption { type = str; };
    dataDir = mkOption { type = str; };
    email = mkOption { type = str; };
  };
  config = {
    domain = "pumuckipla.net";
    dataDir = "/data";
    email = "rahelkempf@gmx.ch";
  };
}
