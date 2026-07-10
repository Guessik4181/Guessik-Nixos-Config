{ pkgs, ... }:
{
  users.users.guessik = {
    isNormalUser = true;
    description = "Guessik";
    #name = "pideriver";
    #home = "/home/pideriver";
    extraGroups = [ 
      "networkmanager" # network managing privileges
      "wheel" # sudouser
      "scanner" # SANE scanner privileges
      "lp" # CUPS printing privileges
      "video" # allows backlight control with light
    ];
  };
}
