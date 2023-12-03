{
  description = "smol C++ env";

  outputs = { self, nixpkgs }: let
    name = "aoc-2023";
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    devShells."${system}".default = pkgs.mkShell {
      name = name;

      nativeBuildInputs = with pkgs; [ gcc gdb tup ];

      shellHook = ''
        if command -v fish > /dev/null
          then fish && exit
        fi
      '';
    };
  };
}
