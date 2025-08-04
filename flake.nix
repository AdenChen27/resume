{
  description = "rendercv resume project with poetry2nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    poetry2nix.url = "github:nix-community/poetry2nix";
  };

  outputs = { self, nixpkgs, poetry2nix, ... }:
    let
      systems = [ "aarch64-darwin" "x86_64-linux" ];
      forAllSystems = f:
        builtins.listToAttrs (map (system: {
          name = system;
          value = f system;
        }) systems);
    in {
      devShells = forAllSystems (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ poetry2nix.overlays.default ];
          };
        in {
          default = pkgs.mkShell {
            packages = [
              # Makes `rendercv` CLI available in the shell
              (pkgs.poetry2nix.mkPoetryApplication {
                projectDir = ./.;
                python = pkgs.python312;
              })
            ];
          };
        });
    };
}

