# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
# sudo nixos-rebuild switch
# List packages installed in system profile. To search, run:
# $ nix search wget
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    firefox
    neofetch
    htop
    btop-rocm
    wget
    gitFull
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        bbenoist.nix
      ];
    })
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
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  systemd.packages = with pkgs; [lact];
  systemd.services.lactd.wantedBy = ["multi-user.target"];
environment.systemPackages = with pkgs; [ nfs-utils ];
boot.initrd = {
  supportedFilesystems = [ "nfs" ];
  kernelModules = [ "nfs" ];
};
}
