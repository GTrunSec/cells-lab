{
  devshell,
  nixpkgs,
  cells,
}:
devshell.legacyPackages.mkShell {
  name = "Cells: Action Shell";
  imports = [
    cells.soc-action.devshellProfiles.default
  ];
}