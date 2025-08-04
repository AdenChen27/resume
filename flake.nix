{
  description = "RenderCV resume builder";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    poetry2nix.url = "github:nix-community/poetry2nix";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, poetry2nix, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        p2n = poetry2nix.lib.mkPoetry2Nix { inherit pkgs; };

        pythonEnv = p2n.mkPoetryEnv {
          projectDir = ./.;
        };
      in {
        devShells.default = pkgs.mkShell {
          packages = [
            pythonEnv
            pkgs.texliveFull
            pkgs.git
          ];

          # Optional: helpful env vars
          shellHook = ''
            echo "Python + RenderCV dev shell activated"
          '';
        };
      });
}

