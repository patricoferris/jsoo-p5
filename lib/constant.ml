open Js_of_ocaml

type t = [ `HALF_PI | `PI | `QUARTER_PI | `TAU | `TWO_PI | `DEGREES | `RADIANS ]

let to_js = function
  | `HALF_PI -> Js.Unsafe.(js_expr "HALF_PI")
  | `PI -> Js.Unsafe.(js_expr "PI")
  | `QUARTER_PI -> Js.Unsafe.(js_expr "QUARTER_PI")
  | `TAU -> Js.Unsafe.(js_expr "TAU")
  | `TWO_PI -> Js.Unsafe.(js_expr "TWO_PI")
  | `DEGREES -> Js.Unsafe.(js_expr "DEGREES")
  | `RADIANS -> Js.Unsafe.(js_expr "RADIANS")
