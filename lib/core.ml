open Js_of_ocaml

let create_canvas ?(webgl = false) width height =
  let threed = if webgl then [| Js.Unsafe.(js_expr "WEBGL") |] else [||] in
  Js.Unsafe.(
    fun_call (js_expr "createCanvas")
      (Array.concat [ [| inject width; inject height |]; threed ]))

let setup ~f () = f

let draw ~f () = f
