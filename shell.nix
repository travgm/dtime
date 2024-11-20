{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
     pkgs.ocaml
     pkgs.opam
     pkgs.dune_3
     pkgs.gcc
     pkgs.ocamlPackages.findlib
     pkgs.ocamlPackages.core
     pkgs.ocamlPackages.core_unix
     pkgs.ocamlPackages.ppx_jane
     
  ];

  shellHook = ''
     eval $(opam env)
  '';
}
