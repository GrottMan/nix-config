{
  config,
  pkgs,
  ...
}: {
  # ... other configuration options

  # Set aliases globally
  environment.shellAliases = {
    ll = "ls -lh";
    gc = "git commit";
    update = "./rebuild.sh";
  };
}
