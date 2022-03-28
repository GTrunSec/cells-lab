{
  __nixpkgs__,
  makeTemplate,
}: {
  name ? "makeSubstitution",
  env,
  source,
}: let
  template = makeTemplate {
    inherit name;
    replace = env;
    template = source;
  };
in
  __nixpkgs__.writeTextFile {
    inherit name;
    executable = false;
    destination = "/${name}";
    text = builtins.readFile "${template}/template";
  }
