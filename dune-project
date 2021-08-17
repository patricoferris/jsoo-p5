(lang dune 2.7)

(name p5)

(generate_opam_files true)

(source
 (github patricoferris/jsoo-p5))

(license ISC)

(authors "Patrick Ferris")

(maintainers "pf341@patricoferris.com")

(package
 (name p5)
 (synopsis "Js_of_ocaml bindings for p5.js")
 (description "Js_of_ocaml bindings for p5.js using the library brr")
 (depends
   js_of_ocaml
   brr))
