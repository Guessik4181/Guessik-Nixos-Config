{ pkgs, ... }:
{
  stylix = {
    enable = true;
    base16Scheme = ../theme/BBPP.yaml;
    image = ../theme/wallpaper.png;
    #targets.vesktop.enable = false;
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
	name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
	name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
	name = "DejaVu Serif";
      };
    };
#    cursor = {
#      package = pkgs.bibata-cursors;
#      name = "Bibata-Modern-Classic";
#      size = 12;
#    };
# This forces KDE to actually apply the image Stylix is pointing to
};
  systemd.user.services.fix-kde-wallpaper = {
    description = "Force KDE to use the Stylix wallpaper";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    script = ''
      ${pkgs.kdePackages.plasma-workspace}/bin/plasma-apply-wallpaperimage ${../theme/wallpaper.png}
    '';
  };
}
