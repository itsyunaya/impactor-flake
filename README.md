# impactor-flake

This is a Nix Flake for [impactor](https://impactor.claration.dev/) by [claration](https://github.com/claration).

It will be archived once impactor is available in Nixpkgs.

## Usage

> [!WARNING]  
> Using this Flake may lead to very long rebuild times, since impactor needs to be compiled from source.

1. Add the Flake to your inputs
```nix
inputs = {
    impactor-flake = {
        url = "github:itsyunaya/impactor-flake";
        inputs.nixpkgs.follows = "nixpkgs";
    };
};
```

2. Add the package to your `systemPackages`
```nix
environment.systemPackages = [
    inputs.impactor-flake.packages.${pkgs.stdenv.hostPlatform.system}.default
];
```

3. Rebuild

## Credits

Certain parts of the package derivation have been adapted from this [draft PR](https://github.com/NixOS/nixpkgs/pull/554137)
on the Nixpkgs repository.
