# Start of systempackages.nix
# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
# sudo nixos-rebuild switch
# List packages installed in system profile. To search, run:
# $ nix search wget

{pkgs, ...}: {
  # This block defines the system-wide packages.
  environment.systemPackages = with pkgs; [
    firefox
    neofetch
    htop
    btop-rocm
    wget
    gitFull
    vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        bbenoist.nix
      ];
    }
    github-desktop
    gnome-keyring
    alejandra
    kdePackages.partitionmanager
    prusa-slicer
    mangohud
    steam-run
    rocmPackages.rocmPath
    fastfetch
    lact
    lutris
    protonplus
    vlc
    subtitleedit
    maxcso
    nfs-utils
  ];

  # Enables AppImage support.
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  # Enables Steam and configures firewall rules.
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # Configures the lactd service for AMD GPUs, which is needed by the lact GUI.
  services.lactd = {
    enable = true;
    package = pkgs.lact;
  };
# End of systempackages.nix

  # NFS support in the initial ramdisk.
  boot.initrd.supportedFilesystems = [ "nfs" ];
  boot.initrd.kernelModules = [ "nfs" ];
}
