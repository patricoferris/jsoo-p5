open Brr

type t = Jv.t

let call sketch method' args =
  match sketch with
  | Some sketch -> Jv.call sketch method' args
  | None -> Jv.call (Window.to_jv G.window) method' args

let get sketch prop =
  match sketch with
  | Some sketch -> Jv.get sketch prop
  | None -> Jv.get (Window.to_jv G.window) prop

let set sketch k v =
  match sketch with
  | Some sketch -> Jv.set sketch k v
  | None -> Jv.set (Window.to_jv G.window) k v

let setup ?sketch fn = set sketch "setup" (Jv.repr fn) |> ignore

let draw ?sketch fn = set sketch "draw" (Jv.repr fn) |> ignore

let key_pressed ?sketch fn = set sketch "keyPressed" (Jv.repr fn) |> ignore

let run ?sketch ?setup:s ?draw:d ?key_pressed:k () =
  Option.iter (setup ?sketch) s;
  Option.iter (draw ?sketch) d;
  Option.iter (key_pressed ?sketch) k

let with_sketch ?id (fn : t -> unit) =
  let p5 = Jv.get (Window.to_jv G.window) "p5" in
  let id = Jv.of_option ~none:Jv.null Jv.of_string id in
  Jv.new' p5 [| Jv.repr fn; id |] |> ignore
