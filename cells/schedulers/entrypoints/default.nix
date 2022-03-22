{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
  inherit (inputs.cells._writers.library) writePiplelineApplication;
in {
  cmd = writePiplelineApplication {
    runtimeInputs = [nixpkgs.julia_17-bin];
    path = ./.;
    args = ["cmd.jl"];
  };
}
