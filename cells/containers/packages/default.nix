{
  inputs,
  cell,
}: let
  inherit (cell.library) nixpkgs;
in {
  opencti-platform = nixpkgs.callPackage ./images/opencti-platform.nix {};
  cliche-example = nixpkgs.callPackage ./images/cliche-example.nix {inherit inputs cell;};
}
