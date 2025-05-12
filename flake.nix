{
  description = ">>> TODO: fill this in <<<";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
    treefmt-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/treefmt-nix";
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
          flake-parts + nix-systems/default + treefmt-nix
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
