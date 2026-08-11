{ pkgs, systemSettings, ... }:
{
  networking = {
    hostName = systemSettings.hostname;
    networkmanager.enable = true;
  };
  
  networking.firewall = rec {
  allowedTCPPorts = [25565]; #minecraft
  allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
  allowedUDPPortRanges = allowedTCPPortRanges;
};
  
  services.openssh.enable = true;
  services.logmein-hamachi.enable = true;
}
