# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
# sudo nixos-rebuild switch
# List packages installed in system profile. To search, run:
# $ nix search wget
{
  config,
  pkgs,
  ...
}: {
  boot.supportedFilesystems = ["ntfs"];

  fileSystems."/mnt/2tb-m2" = {
    device = "/dev/disk/by-uuid/D8D6ABD1D6ABADE6";
    fsType = "ntfs";
    options = [
      # If you don't have this options attribute, it'll default to "defaults"
      # boot options for fstab. Search up fstab mount options you can use
      "users" # Allows any user to mount and unmount
      "nofail" # Prevent system from failing if this drive doesn't mount
      "uid=1000"
      "gid=1000"
      "dmask=000"
      "fmask=000"
    ];
  };
  fileSystems."/mnt/4tb-hdd" = {
    device = "/dev/disk/by-uuid/8425-62D8 ";
    fsType = "exfat";
    options = [
      # If you don't have this options attribute, it'll default to "defaults"
      # boot options for fstab. Search up fstab mount options you can use
      "users" # Allows any user to mount and unmount
      "nofail" # Prevent system from failing if this drive doesn't mount
      "uid=1000"
      "gid=1000"
      "dmask=000"
      "fmask=000"
    ];
  };
  fileSystems."/mnt/5tb-games" = {
    device = "/dev/disk/by-uuid/42C08394C0838CBB";
    fsType = "ntfs";
    options = [
      # If you don't have this options attribute, it'll default to "defaults"
      # boot options for fstab. Search up fstab mount options you can use
      "users" # Allows any user to mount and unmount
      "nofail" # Prevent system from failing if this drive doesn't mount
      "uid=1000"
      "gid=1000"
      "dmask=000"
      "fmask=000"
    ];
  };
}
