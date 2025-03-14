{ lib, ... }:
{
  options = with lib; with types; {
    domain = mkOption { type = str; };
    dataDir = mkOption { type = str; };
    email = mkOption { type = str; };
  };
  config = {
    domain = "r5v.ch";
    dataDir = "/data";
    email = "rahelkempf@gmx.ch";
  };
}
