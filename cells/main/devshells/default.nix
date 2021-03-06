{
  inputs,
  cell,
}: let
  l = nixpkgs.lib // builtins;
  inherit (inputs) nixpkgs std;
in
  l.mapAttrs (_: std.std.lib.mkShell) {
    default = {...}: {
      name = "Cells Lab";
      imports = [
        cell.devshellProfiles.default
        cell.devshellProfiles.docs
        inputs.cells.cargoMake.devshellProfiles.default
      ];
      nixago = [
        cell.nixago.treefmt
      ];
    };
    update = {...}: {imports = [inputs.cells.update.devshellProfiles.default];};
  }
