{
		description = "My first flake!";

		inputs = {
				nixpkgs.url = "nixpkgs/nixos-23.11";
				home-manager.url = "github:nix-community/home-manager/release-23.11";
				home-manager.inputs.nixpkgs.follows = "nixpkgs";
		};

		outputs = { self, nixpkgs, home-manager, ... }:
				let
				system = "x86_64-linux";
		lib = nixpkgs.lib;
# pkgs = nixpkgs.legacyPackages.${system};
		pkgs = 
				(import nixpkgs {
				 inherit system;
				 config = {
				 permittedInsecurePackages = [
				 "python-2.7.18.7"
				 ];
				 };
				 });
		in {
				nixosConfigurations = {
						nixos = lib.nixosSystem {
								inherit system;
								modules = [ ./configuration.nix ];
						};
				};
				homeConfigurations = {
						manuel = home-manager.lib.homeManagerConfiguration {
								inherit pkgs;
								modules = [ ./home.nix ];
						};
				};
		};
}
