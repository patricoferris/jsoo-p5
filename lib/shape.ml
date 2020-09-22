open Js_of_ocaml
open Utils

module Primitives = struct
  type t

  let rect (x : float) (y : float) (w : float) (h : float) =
    Js.Unsafe.(
      func ~f:"rect" ~args:[| inject x; inject y; inject w; inject h |])

  let ellipse (x : float) (y : float) (w : float) (h : float) =
    Js.Unsafe.(
      func ~f:"ellipse" ~args:[| inject x; inject y; inject w; inject h |])

  let triangle x1 y1 x2 y2 x3 y3 =
    Js.Unsafe.(
      func ~f:"line"
        ~args:
          [| inject x1; inject y1; inject x2; inject y2; inject x3; inject y3 |])

  let line_2d x1 y1 x2 y2 =
    Js.Unsafe.(
      func ~f:"line" ~args:[| inject x1; inject y1; inject x2; inject y2 |])

  let line_3d x1 y1 z1 x2 y2 z2 =
    Js.Unsafe.(
      func ~f:"line"
        ~args:
          [| inject x1; inject y1; inject z1; inject x2; inject y2; inject z2 |])
end
