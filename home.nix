{ lib, userSettings, systemSettings, ... }:

{
  imports = [
    ### environment ###

    # taskbar
    homeModules/waybar.nix
    # menu generator
    homeModules/rofi.nix
    # notification daemon
    homeModules/mako.nix
    # window portal
    homeModules/xdg-autostart.nix
    # Java
    homeModules/java.nix

    ### basic programs ###

    # terminal emulator
    homeModules/${userSettings.terminal}.nix

    ### CLI tools ###

    # zsh
    homeModules/zsh.nix
    # git
    homeModules/git.nix
    # fzf, general fuzzy finder
    homeModules/fzf.nix

    ### Wine programs ###
    homeModules/lutris.nix

    ### Data manipulation ###
    homeModules/obsidian.nix

    ### Home-manager packages ###
    homeModules/homePackages.nix

    ###Additional programs###
    homeModules/vscode.nix
    homeModules/obsOverlay.nix
    homeModules/KDEconnect.nix

  ] ++ lib.optionals (systemSettings.hostname == "guessik") [

    # discord client
    homeModules/vesktop.nix
    # ...
  ];


  
  # extra info for home-manager
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;
  home.stateVersion = "26.05";
  
  home.sessionVariables = {
    EDITOR = "Kate";
    VISUAL = "Kate";
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Custom Cursor
  home.file.".icons/Chiharu".source = ./theme/Chiharu;

  home.file.".config/awesome" = {source = ./awesome; recursive = true;};
  #gtk.cursorTheme.name = "Chiharu";
}
