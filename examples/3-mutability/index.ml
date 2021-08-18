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
