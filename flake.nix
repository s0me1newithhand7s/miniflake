{
  description = "miniflake.";
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
  };
  
  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations = {
      miniflake = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          (
            {
              fileSystems."/".device = "/dev/null";
              boot.systemd-boot.enable = true;
            }
          )
        ];
      };
    };
  };
}
