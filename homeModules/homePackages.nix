{ pkgs, pkgs-stable, systemSettings, ... }:
{


  home.packages = (with pkgs; [
    ### CLI utils ###

    # fetch files from web address
    wget

    # Linux コナステ dependancies
    xdg-utils
    zenity

    # Instant status updates
    acpid

    # get detailed hardware information
    lshw

    # System Monitor
    monitor

    #Tool to list open files
    lsof

    # Anime Tools
    ani-cli
    ani-skip

    ### Hardware and Peripherals ###

    # Anything to do with sound
    alsa-utils
    pamixer
    # Open-source CLI tool to manage headset settings
    headsetcontrol
    # volume control GUI
    pavucontrol
    # Command line monitor tool
    xrandr
    # Audio patchbay
    qpwgraph
    # Disk tool
    gparted
    ntfs3g
    # Remote drive tools
    cifs-utils
    nfs-utils

    ### Data manipulation ###

    # file menager
    kdePackages.dolphin
    # wayland clipboard utilities
    wl-clipboard
    # Open-source office suite
    libreoffice
    #text editor
    kdePackages.kate
    #coding
    vscode
    # Zip Files
    zip
    unzip
    p7zip
    # Ebook Reader
    foliate
    # drag and drop utility
    dragon-drop
    #burning multiple iso to a USB driver
    #ventoy

    ### Alternate browsers ###
    librewolf

    ### Security ###
    # Password Manager
    #bitwarden-desktop
    # VPN
    #proton-vpn

    ### Games/Emulation ###
    # Wine Emulator
    winetricks
    wineWow64Packages.waylandFull
    bottles
    heroic
    # Wine Manager
    protonplus
    #frame limiter
    libstrangle
    #electron
    electron
    #osu and etterna
    osu-lazer-bin
    etterna

    ### Video/Audio/Pictures ###
    # Video
    vlc
    # Recording
    obs-studio
    # Music
    musicpod
    #audio
    ardour
    audacity
    #screenshot
    flameshot


    ### Backup Utility ###
    luckybackup

    ### Network stuff ###
    haguichi


  ])++ (with pkgs-stable; [
    ### Packages that break often and don't need to be bleeding edge ###
    parallel-launcher
    kdePackages.kdenlive
#    libreoffice
  ]);


  #Add enviroment path for konaste
  home.sessionPath = [ "$HOME/.local/bin" ];
  
  #Change to custom cursor
  gtk.cursorTheme.name = "Chiharu";
  gtk.cursorTheme.size = 12;
}
