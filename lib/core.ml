open Js_of_ocaml

(* open Utils  *)

let create_canvas ~width ~height =
  Js.Unsafe.(
    fun_call (js_expr "createCanvas") [| inject width; inject height |])

let setup ~f () = f

let draw ~f () = f
