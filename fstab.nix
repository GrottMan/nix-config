# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # Ensure the necessary filesystem drivers are available in the boot image
  # for the local drives.
  boot.supportedFilesystems = [ "ntfs" "exfat" ];

  # Enable the NFS client for network shares.
  networking.nfs.client.enable = true;

  # This section defines all file systems to be mounted at boot,
  # combining your local and network mounts into one block.
  fileSystems = {
    "/mnt/2tb-m2" = {
      device = "/dev/disk/by-uuid/D8D6ABD1D6ABADE6";
      fsType = "ntfs";
      options = [
        "users"
        "nofail"
        "uid=1000"
        "gid=1000"
        "dmask=000"
        "fmask=000"
      ];
    };

    "/mnt/4tb-hdd" = {
      device = "/dev/disk/by-uuid/8425-62D8"; # <--- Trailing space removed
      fsType = "exfat";
      options = [
        "users"
        "nofail"
        "uid=1000"
        "gid=1000"
        "dmask=000"
        "fmask=000"
      ];
    };

    "/mnt/5tb-games" = {
      device = "/dev/disk/by-uuid/42C08394C0838CBB";
      fsType = "ntfs";
      options = [
        "users"
        "nofail"
        "uid=1000"
        "gid=1000"
        "dmask=000"
        "fmask=000"
      ];
    };

    "/mnt/film" = {
      device = "10.0.0.15:/mnt/user/film";
      fsType = "nfs";
      options = [
        "vers=4"
        "rw"
        "exec"
        "user"
        "sec=sys"
      ];
    };

    "/mnt/tv" = {
      device = "10.0.0.15:/mnt/user/tv";
      fsType = "nfs";
      options = [
        "vers=4"
        "rw"
        "exec"
        "user"
        "sec=sys"
      ];
    };

    "/mnt/download" = {
      device = "10.0.0.15:/mnt/user/download";
      fsType = "nfs";
      options = [
        "vers=4"
        "rw"
        "exec"
        "user"
        "sec=sys"
      ];
    };
    
    "/mnt/iso" = {
      device = "10.0.0.15:/mnt/user/iso";
      fsType = "nfs";
      options = [
        "vers=4"
        "rw"
        "exec"
        "user"
        "sec=sys"
      ];
    };

    "/mnt/filer" = {
      device = "10.0.0.15:/mnt/user/filer";
      fsType = "nfs";
      options = [
        "vers=4"
        "rw"
        "exec"
        "user"
        "sec=sys"
      ];
    };
  };

  # Ensure all mount points exist on the filesystem.
  system.activationScripts.postActivation.text = ''
    mkdir -p /mnt/2tb-m2
    mkdir -p /mnt/4tb-hdd
    mkdir -p /mnt/5tb-games
    mkdir -p /mnt/film
    mkdir -p /mnt/tv
    mkdir -p /mnt/download
    mkdir -p /mnt/iso
    mkdir -p /mnt/filer
  '';
}
