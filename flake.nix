{
	inputs = {
		nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";
		impactor-src = {
			url = "github:claration/impactor";
			flake = false;
		};
	};

	outputs = { nixpkgs, impactor-src, self }: let
		# macOS support coming soon
		systems = [ "x86_64-linux" "aarch64-linux" /* "aarch64-darwin" */ ];

		forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
	in {
		packages = forAllSystems (pkgs: let
			impactor = pkgs.callPackage ./package.nix { inherit impactor-src; };
		in {
			inherit impactor;
			default = impactor;
		});
	};
}
