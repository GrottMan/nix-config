# Start of alias.nix
{
  config,
  pkgs,
  ...
}: {
  # Set aliases for all users in any shell that supports them
  environment.shellAliases = {
    ll = "ls -lh";
    gc = "git commit";
    # update = "sudo nixos-rebuild switch"; # original
    update = "bash /home/tomas/nix-config/rebuild.sh"; # mitt kommando för att köra batch-filen
  };

  # OR, if you want aliases specific to a shell like Bash, use this instead:
  # programs.bash.shellAliases = {
  #   ll = "ls -lh";
  #   gc = "git commit";
  #   update = "sudo nixos-rebuild switch";
  # };
}
# End of alias.nix
