{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs self data-merge;
  inherit (cell) nomadJobs dockerJobs generator library nixosProfiles;
  inherit (inputs.cells._modules.library) makeSocProfile makeConfiguration;
  inherit (inputs.cells._writers.library) writeShellApplication;
  inherit (inputs.cells.makes.library) makeSubstitution;

  name = "opencti-docker-compose";

  justfile = makeSubstitution {
    name = "justfile";
    env = {
      __argFile__ = name;
    };
    source = ./justfile;
  };
in
  makeConfiguration {
    inherit name;
    target = "docker-compose";
    searchPaths.source = ["${justfile}/justfile"];
    branch = "prod";
    searchPaths.bin = [];
    source = dockerJobs.compose {};
    format = "yaml";
  }