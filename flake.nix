{
  description = "A home for my flake templates";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";

    git-hooks-nix.url = "github:cachix/git-hooks.nix";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    systems.url = "github:nix-systems/default";

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      imports = [
        ./templates/default/nix/formatting.nix
      ];
      flake.templates.default = {
        path = ./templates/default;
        description = ''
          flake-parts + nix-systems/default + treefmt-nix + git-hooks-nix
        '';
      };
      flake.templates.python = {
        path = ./templates/python;
        description = ''
          the default template + uv2nix
        '';
      };
    };
}
