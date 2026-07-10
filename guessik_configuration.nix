{ ... }:
{
  imports = [
    ./common_configuration.nix

    nixModules/steam.nix
  ];
  #for ventoy although I rarely use it so I just commented it out(same with homemenager)
#   nixpkgs.config.permittedInsecurePackages = [
#                 "ventoy-1.1.10"
#               ];

#mounts

  #swap partition
   swapDevices = [{device = "/dev/sda3";}];

  #max generations set to 5
  boot.loader.systemd-boot.configurationLimit = 5;
}
