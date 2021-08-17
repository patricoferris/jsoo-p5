open P5

(* ~~~ State ~~~ *)
let c : Color.t option ref = ref None

let i = ref 0.

(* ~~~ Wave function ~~~ *)
let wave x =
((Math.sin x +. 1.) /. 2.) *. 255.

(* ~~~ Sketch ~~~ *)
let setup () =
  Canvas.create 800 800 |> ignore;
  c := Some (Color.make 255 0 0)

let draw () =
  Option.iter Color.background !c;
  Option.iter (fun c -> Color.set_green c (wave !i |> int_of_float)) !c;
  i := !i +. 0.01

let () =
  Sketch.run ~setup ~draw ()