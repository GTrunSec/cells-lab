{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs threatbus2nix vast2nix;
in {
  inherit
    (vast2nix.packages)
    vast-release
    vast-latest
    ;
  inherit
    (threatbus2nix.packages)
    threatbus
    threatbus-latest
    ;
}