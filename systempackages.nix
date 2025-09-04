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
    btop
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
  ];
}
