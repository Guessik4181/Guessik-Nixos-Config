For first build:

1. cd /etc/nixos
2. sudo nano configuration.nix

3. Change hostname to desired build (you can change guessik_gpu.nix, guessik_configuration.nix, user_guessik.nix to your hostname but you gonna need to change the files it's pointing to in common configuration)
4. And add the lines below:
5. nix.settings.experimental-features = [ "nix-command" "flakes" ];
6. programs.git.enable = true;

7. sudo nixos-rebuild switch
8. reboot

9. copy everything to $HOME/.dotfiles
10. Make sure to change the home.nix hostname (for lib.optionals), homePackages.nix hostname, and flakes.nix hostname (near the bottom of file) to whatever hostnames are being used
11. This now uses the hardware-configuration.nix file stored in /etc/nixos/ so it no longer needs to be copied to the .dotfiles directory

12. cd $HOME/.dotfiles
13. sudo nixos-rebuild switch --impure --flake .

Addional notes: 
1. Awesome folder isn't needed if you won't be using Awesome as your desktop enviroment same goes with AwesomeWM.nix and HomeAwesome.nix
2. endlessDream folder, bms commands in zsh.nix and MiyakoMeowis in your flakes are useless if you won't be playing BMS
3. ardour is not needed, keeping it is a preferenc
4. In the future gonna look into getting rid of anything that is for hyperland that I don't need/use (aka waybar.nix)
5. I'm currently working on shifting a lot of theming stuff to rc.lua in awesome folder since you can't didctate how it looks through .nix files
