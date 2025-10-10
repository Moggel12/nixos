{ config, ... }:

{
  home.file.".config/hypr/".source = config.lib.file.mkOutOfStoreSymlink ./hypr;
}
