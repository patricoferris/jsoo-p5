module Core = Core
module Color = Color
module Shape = Shape
module Transform = Transform

let push () = Utils.func ~f:"pop" ~args:[||]

let pop () = Utils.func ~f:"pop" ~args:[||]

let no_loop () = Utils.func ~f:"noLoop" ~args:[||]

let is_looping () : bool = Utils.func ~f:"isLooping" ~args:[||]

let background ((r, g, b, _) : Color.t) =
  let open Js_of_ocaml in
  Utils.func ~f:"background" ~args:Js.Unsafe.[| inject r; inject g; inject b |]

module type Sketch = sig
  val setup : unit -> unit

  val draw : unit -> unit
end

module Make (S : Sketch) = struct
  let () =
    let open Js_of_ocaml in
    Js.Unsafe.(set global "setup" S.setup);
    Js.Unsafe.(set global "draw" S.draw)
end
