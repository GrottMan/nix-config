{
  config,
  pkgs,
  ...
}: {
  # Set aliases for all users in any shell that supports them
  environment.shellAliases = {
    ll = "ls -lh";
    gc = "git commit";
    # update = "sudo nixos-rebuild switch";
    update = "bash /home/tomas/nix-config/rebuild.sh";
  };

  # OR, if you want aliases specific to a shell like Bash, use this instead:
  # programs.bash.shellAliases = {
  #   ll = "ls -lh";
  #   gc = "git commit";
  #   update = "sudo nixos-rebuild switch";
  # };
}
