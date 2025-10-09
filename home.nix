{ config, pkgs, ... }:

{
  # Setup user and home
  home.username = "moggel";
  home.homeDirectory = "/home/moggel";

  # Setup config links
  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
  home.file.".gitconfig".source = ./gitconfig;
  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/nvim";

  imports = [
    ./home/modules
  ];

  programs.waybar.enable = true;

  # Setup user packages
  home.packages = with pkgs; [
    btop
    fzf
    nmap
    zsh
    bitwarden-desktop
  ];


  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards 
  # incompatible changes.
  # 
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version 
  # changes in each release.
  home.stateVersion = "25.05";
}
