Examples
--------

Lots of example sketches to get a taste of coding creatively with OCaml.

#### Red square 

The quintessential "hello world" p5 sketch

<!-- $MDX file=0-red-square/index.ml -->
```ocaml
open P5

let setup () = Canvas.create 800 800 |> ignore

let draw () =
  Color.fill (Color.make 255 0 0);
  Shape.rect 50. 50. 50. 50.

let () = Sketch.run ~setup ~draw ()
```

#### Changing background colour 

Smoothly changing the background colour with `Math.sin`

<!-- $MDX file=1-colour-changing/index.ml -->
```ocaml
open P5

(* ~~~ State ~~~ *)
let c : Color.t option ref = ref None

let i = ref 0.

(* ~~~ Wave function ~~~ *)
let wave x = (Math.sin x +. 1.) /. 2. *. 255.

(* ~~~ Sketch ~~~ *)
let setup () =
  Canvas.create 800 800 |> ignore;
  c := Some (Color.make 255 0 0)

let draw () =
  Option.iter Color.background !c;
  Option.iter (fun c -> Color.set_green c (wave !i |> int_of_float)) !c;
  i := !i +. 0.01

let () = Sketch.run ~setup ~draw ()
```

#### With sketch

<!-- $MDX file=2-with-sketch/index.ml -->
```ocaml
open P5

let () =
  Sketch.with_sketch @@ fun sketch ->
  let setup () = Canvas.create ~sketch 800 800 |> ignore in
  let draw () =
    Color.fill ~sketch (Color.make ~sketch 255 0 0);
    Shape.rect ~sketch 50. 50. 50. 50.
  in
  Sketch.run ~sketch ~setup ~draw ()
```

This shows how to use p5 in instance-mode for OCaml. Typically you only need to do this when you want more than one canvas per page, or it is needed if you are running sketches in the toplevel.


#### Mutablity and Keyboard Input

This example shows how to use mutable record field in OCaml to be close to Javascript objects. The API is still more "functional" in the sense of passing the "object" to setters. 

It also shows how to use keyboard input via the `key_pressed` function.

<!-- $MDX file=3-mutability/index.ml -->
```ocaml
open P5

module Player = struct
  type position = { x : float; y : float }

  type t = { mutable position : position }

  let make x y = { position = { x; y } }

  let set_x t x' = t.position <- { t.position with x = x' }

  let set_y t y' = t.position <- { t.position with y = y' }

  let render t =
    let { x; y } = t.position in
    Shape.rect x y 25. 25.
end

let player = Player.make 10. 10.

(* ~~~ Sketch ~~~ *)
let setup () = Canvas.create 800 800 |> ignore

let draw () =
  Color.(background @@ make 255 255 255);
  Color.(fill @@ make 255 0 0);
  Player.render player

let key_pressed () =
  let open Events in
  match Keyboard.key_code () with
  | t when t = Keyboard.left_arrow ->
      Player.set_x player (player.position.x -. 5.)
  | t when t = Keyboard.right_arrow ->
      Player.set_x player (player.position.x +. 5.)
  | t when t = Keyboard.up_arrow -> Player.set_y player (player.position.y -. 5.)
  | t when t = Keyboard.down_arrow ->
      Player.set_y player (player.position.y +. 5.)
  | _ -> ()

let () = Sketch.run ~setup ~draw ~key_pressed ()
```
