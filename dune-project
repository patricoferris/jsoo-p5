(lang dune 2.7)

(name p5)

(generate_opam_files true)

(source
 (github patricoferris/ocaml-p5))

(license ISC)

(authors "Patrick Ferris")

(maintainers "pf341@patricoferris.com")

(package
 (name p5)
 (synopsis "OCaml bindings for p5.js")
 (description "Use js_of_ocaml and these bindings to build with p5.js")
 (depends
  (alcotest :with-test)
  js_of_ocaml-ppx
  js_of_ocaml-lwt
  js_of_ocaml-compiler))
