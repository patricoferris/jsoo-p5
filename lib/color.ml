open Js_of_ocaml
open Utils

type t = int * int * int * int

type color

type color_mode = RGB | HSB | HSL

let color_mode_to_js = function
  | RGB -> Js.Unsafe.js_expr "RGB"
  | HSB -> Js.Unsafe.js_expr "HSB"
  | HSL -> Js.Unsafe.js_expr "HSL"

let color r g b a : color =
  Js.Unsafe.(func ~f:"color" ~args:[| inject r; inject g; inject b; inject a |])

let color_mode mode args = func ~f:(color_mode_to_js mode) ~args

let red ~alpha = (255, 0, 0, alpha)

let green ~alpha = (0, 255, 0, alpha)

let blue ~alpha = (0, 0, 255, alpha)

let get_alpha (c : color) : int = func ~f:"alpha" ~args:[| Js.Unsafe.inject c |]

let get_red (c : color) : int = func ~f:"red" ~args:[| Js.Unsafe.inject c |]

let get_blue (c : color) : int = func ~f:"blue" ~args:[| Js.Unsafe.inject c |]

let get_green (c : color) : int = func ~f:"green" ~args:[| Js.Unsafe.inject c |]

let fill ((r, g, b, a) : t) =
  Js.Unsafe.(func ~f:"fill" ~args:[| inject r; inject g; inject b; inject a |])

let no_fill () = func ~f:"noFill" ~args:[||]
