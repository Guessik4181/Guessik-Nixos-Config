{ pkgs, ... }:

{
  # Disable Stylix for VS Code to prevent any future 'null' errors
  stylix.targets.vscode.enable = false;

  programs.vscode = {
    enable = true;
    package = pkgs.vscode; # Normal unwrapped version as requested

    # All these are standard NixOS packages - no custom hashes needed
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      formulahendry.auto-rename-tag
      esbenp.prettier-vscode
      ecmel.vscode-html-css
    ];

    userSettings = {
      "workbench.colorTheme" = "Default Dark Modern"; # Standard built-in theme
      "editor.formatOnSave" = true;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
    };
  };
}
