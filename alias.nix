{ config, pkgs, ... }:

{
  environment.shellAliases = {
    "nix.config"  = "EDITOR=\"codium --wait\" sudoedit /etc/nixos/configuration.nix";
    "nix.rebuild" = "sudo nixos-rebuild switch";
    "nix.alias"   = "EDITOR=\"codium --wait\" sudoedit /etc/nixos/alias.nix";
    "nix.nvidia"  = "EDITOR=\"codium --wait\" sudoedit /etc/nixos/nvidia.nix";
    "hypr.config" = "codium /home/swarley/.config/hypr/hyprland.lua";
    "hyprpaper.config" = "codium /home/swarley/.config/hypr/hyprpaper.conf";
    "hyprpaper.reload" = "systemctl --user restart hyprpaper.service";
  };
}
