{
  description = "miniflake.";
  inputs."nixpkgs".url = "github:nixos/nixpkgs/nixos-unstable";
  
  outputs = inputs @{nixpkgs}: {
    nixosConfigurations ."default" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [({
          fileSystems."/".device = "/dev/null";
          boot.loader.systemd-boot.enable = true;
        })];
      };
    };
}
