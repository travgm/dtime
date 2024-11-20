(lang dune 3.15)

(name dtime)

(generate_opam_files true)

(source
 (github travgm/dtime))

(authors "Travis Montoya")

(maintainers "Travis Montoya")

(license "MIT")

(documentation https://www.travgm.org)

(package
 (name dtime)
 (synopsis "Time to decimal time")
 (description "Converts systems monotonic clock time to usable decimal minutes left in a day")
 (depends ocaml dune 
   (ppx_inline_test :with-test)
   (ppx_expect :with-test)))
