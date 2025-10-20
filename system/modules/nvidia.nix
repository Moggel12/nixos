{ pkgs, config, lib, ... }:

let 
  cfg = config.system.nvidia;
in 
{
  options.system.nvidia = {
    enable = lib.mkEnableOption "Enable Nvidia drivers";
  };

  config = lib.mkIf cfg.enable {
    services.xserver.videoDrivers = ["nvidia"];

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    hardware.nvidia = {
      open = true;
      modesetting.enable = true;
      nvidiaSettings = true; 
    };
  };
}
