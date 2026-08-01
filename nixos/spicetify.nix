{ config, lib, pkgs, ... }:

let
spicePkgs = spicetify-nix.packages;
spicetify-nix = import (builtins.fetchTarball { 
    sha256 = "0wnrw6ljgd2mvwlw8xyb2kxk16ylqn3vxrr8x7xwr7jy1izmac9f"; 
    url = "https://github.com/Gerg-L/spicetify-nix/tarball/17e524f330c282d31c32dfe076222d4a12277886"; 
  }) { };
in
{
  imports = [ spicetify-nix.nixosModules.spicetify ];

  programs.spicetify = {
     enable = true;
     enabledExtensions = with spicePkgs.extensions; [
       shuffle # shuffle+ (special characters are sanitized out of extension names)
     ];
     theme = spicePkgs.themes.hazy;
   };
}