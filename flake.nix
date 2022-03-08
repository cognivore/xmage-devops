{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs";
    };

    outputs = {self, nixpkgs}:
        let pkgs = nixpkgs.legacyPackages.x86_64-linux;
        in {
            defaultPackage.x86_64-linux = pkgs.hello;

            devShell.x86_64-linux =
                pkgs.mkShell { buildInputs = [
                    pkgs.openjdk17_headless
                    pkgs.jre pkgs.gradle pkgs.maven
                    pkgs.yq
                    pkgs.hello
                ]; };
        };
}
