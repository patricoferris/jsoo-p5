open Js_of_ocaml
open Utils

type mat = float array array

type vec = float * float * float

let mk_mat a b c d e f = [| [| a; b; c |]; [| d; e; f |]; [| 0.; 0.; 1. |] |]

let mat_to_js (arr : mat) =
  [|
    arr.(0).(0); arr.(0).(1); arr.(0).(2); arr.(1).(0); arr.(1).(1); arr.(1).(2);
  |]
  |> Array.map Js.Unsafe.inject

let vec_to_js ((v1, v2, v3) : vec) =
  [| v1; v2; v3 |] |> Array.map Js.Unsafe.inject

let apply_matrix t = func ~f:"applyMatrix" ~args:(mat_to_js t)

let reset_matrix () = func ~f:"resetMatrx" ~args:[||]

let rotate ?around by =
  match around with
  | Some v ->
      Js.Unsafe.(
        func ~f:"rotate"
          ~args:(Stdlib.Array.concat [ [| inject by |]; vec_to_js v ]))
  | None -> Js.Unsafe.(func ~f:"rotate" ~args:[| inject by |])

let rotate_x by = rotate ~around:(1., 0., 0.) by

let rotate_y by = rotate ~around:(0., 1., 0.) by

let rotate_z by = rotate ~around:(0., 0., 1.) by

let scale ?y s =
  match y with
  | Some y -> Js.Unsafe.(func ~f:"scale" ~args:[| inject s; inject y |])
  | None -> Js.Unsafe.(func ~f:"scale" ~args:[| inject s |])

let shear_x angle = Js.Unsafe.(func ~f:"shearX" ~args:[| inject angle |])

let shear_y angle = Js.Unsafe.(func ~f:"shearY" ~args:[| inject angle |])

let translate ?(z = 0.) x y =
  Js.Unsafe.(func ~f:"translate" ~args:[| inject x; inject y; inject z |])
