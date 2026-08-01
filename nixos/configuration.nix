{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./nvidia.nix
      ./alias.nix
      ./spicetify.nix
      #./sddm.nix
    ];

  
  nixpkgs.config.allowUnfree = true;
  	
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    efibootmgr
    os-prober
    kitty
    firefox
    kdePackages.dolphin
    rofi
    pavucontrol
    waybar
    equibop
    vscodium
    hyprpaper
    fastfetch
  ];

  # BOOTLOADER
  boot.loader = {
    efi.canTouchEfiVariables = true;
    timeout = 600;

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
    };
  };

  # NETWORKING
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # LOCALE
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };
  console.keyMap = "uk";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # GNOME
  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  # PIPEWIRE
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users."swarley" = {
    isNormalUser = true;
    description = "swarley";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };
}