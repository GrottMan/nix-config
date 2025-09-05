# Start of systempackages.nix
# This file defines the system-wide packages to be installed.

{pkgs, ...}: {
  # This block defines the system-wide packages.
  environment.systemPackages = with pkgs; [
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
    home-manager
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

  # NFS support in the initial ramdisk.
  boot.initrd.supportedFilesystems = [ "nfs" ];
  boot.initrd.kernelModules = [ "nfs" ];
}
# End of systempackages.nix
