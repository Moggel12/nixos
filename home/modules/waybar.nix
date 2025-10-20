{ config, ... }:

{
  home.file.".config/waybar/style.css".source = config.lib.file.mkOutOfStoreSymlink ./waybar/style.css;
  home.file.".config/waybar/config.jsonc".source = config.lib.file.mkOutOfStoreSymlink ./waybar/config.jsonc;
}
