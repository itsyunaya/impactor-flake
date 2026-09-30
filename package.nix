{
	autoPatchelfHook,
	gtk3,
	impactor-src,
	lib,
	libappindicator,
	libayatana-appindicator,
	makeWrapper,
	pkg-config,
	rustPlatform,
}:
rustPlatform.buildRustPackage (finalAttrs: {
	pname = "impactor";
	version = "2.6.5";

	src = impactor-src;

	cargoHash = "sha256-BbU+xnbA2tkBaRIwELHPkczW9E69HhRjK4jdmUIqLdo=";

	cargoBuildFlags = [ "--bin" "plumeimpactor" ];

	__structuredAttrs = true;
	strictDeps = true;

	# It would be good practise to leave this as true, but the compile
	# time is already abysmal, and enabling tests would make it even worse.
	doCheck = false;

	nativeBuildInputs = [
		autoPatchelfHook
		makeWrapper
		pkg-config
	];

	buildInputs = [
		gtk3
		libappindicator
		libayatana-appindicator
	];

	runtimeDependencies = [
		libappindicator
		libayatana-appindicator
	];

	# The app renamed to impactor from plumeimpactor,
	# but the binary name remained the same.
	postInstall = ''
		mv $out/bin/plumeimpactor $out/bin/impactor
	'';

	meta = {
		description = "Open-source, cross-platform, and feature rich iOS sideloading application";
		homepage = "https://github.com/itsyunaya/impactor-flake";
		maintainers = [ lib.maintainers.itsyunaya ];
		license = [ lib.licenses.mit ];
		mainProgram = "impactor";
	};
})
