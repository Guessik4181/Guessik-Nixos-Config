    { userSettings, systemSettings, pkgs, config, ... }:
{
    #turning on the x11 server
    services.xserver.enable = true;
    #turning on the KDE Plasma 6 Window manager
    services.desktopManager.plasma6.enable = true;

    #turning on the sddm menager and forcing out wayland
    services.displayManager.sddm = {
    enable = true;
    wayland.enable = false;
    };

    #forcing default version to be x11 one for KDE Plasma 6
    services.displayManager.defaultSession = "plasmax11";

}
