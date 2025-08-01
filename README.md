# flake templates

I'm not really a fan of this sort of stuff, but...

- Python projects: `nix flake init -t github:jfly/flake#python`
    - Update all occurrences of `<<<`.
    - Run `nix run nixpkgs#uv lock`
- Anything else: `nix flake init -t github:jfly/flake`
