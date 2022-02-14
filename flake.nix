{
  inputs.std.url = "github:divnix/std";
  inputs.vast.url = "github:gtrunsec/vast/module-client";
  outputs = inputs:
      inputs.std.grow {
        inherit inputs;
        # as-nix-cli-epiphyte = false;
        cellsFrom = ./cells;
        systems = [
          {
            build = "x86_64-unknown-linux-gnu";
            host = "x86_64-unknown-linux-gnu";
          }
          {
            build = "x86_64-unknown-linux-gnu";
            host = "aarch64-unknown-linux-gnu";
          }
        ];
        organelles = [
          (inputs.std.installables "packages")
          (inputs.std.runnables "entrypoints")
          (inputs.std.functions "library")
          (inputs.std.functions "devshellProfiles")
        ];
      };
}
