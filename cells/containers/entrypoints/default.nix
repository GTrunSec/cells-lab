{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs self nomad spongix nomad-driver-nix;
  inherit (inputs.nixpkgs.lib.strings) fileContents;
  inherit (inputs.cells._writers.library) writeShellApplication;
  inherit (cell) packages;
in {
  opencti-platform-podman = writeShellApplication {
    name = "alpine-podman";
    runtimeInputs = [nixpkgs.podman];
    text = ''
      ${packages.opencti-platform.copyToPodman}/bin/copy-to-podman
      podman run ${packages.opencti-platform.imageName}:${packages.opencti-platform.imageTag} | grep /opt/opencti
      #podman rmi docker.io/library/${packages.opencti-platform.imageName}:${packages.opencti-platform.imageTag}
    '';
  };
}
