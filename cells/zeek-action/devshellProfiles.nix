{
  inputs,
  cell,
}: let
  inherit (cell) packages library devshellProfiles;
  inherit (inputs) nixpkgs;
in {
  default = _: {
    commands = [
      {
        name = "zeek-lint";
        command = ''
          set -euo pipefail
          for path in $(find "$@" -name '*.zeek')
          do
             zeek "$path" >/dev/null
          done
        '';
        category = "zeek-action";
        help = "Check Zeek Scripts Syntax | zeek-lint <your scripts dir>";
      }
      {
        name = "zeek-btest";
        command = ''
          set -euo pipefail
          cd "$@"
          btest --show-all
        '';
        category = "zeek-action";
        help = "Check Zeek Scripts Syntax | zeek-btest <your testing dir>";
      }
    ];
  };
}
