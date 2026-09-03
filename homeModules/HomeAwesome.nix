{ config, pkgs, ... }:
{
  xdg.configFile."awesome".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/.dotfiles/awesome";

}
