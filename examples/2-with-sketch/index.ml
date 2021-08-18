open P5

let () =
  Sketch.with_sketch @@ fun sketch ->
  let setup () = Canvas.create ~sketch 800 800 |> ignore in
  let draw () =
    Color.fill ~sketch (Color.make ~sketch 255 0 0);
    Shape.rect ~sketch 50. 50. 50. 50.
  in
  Sketch.run ~sketch ~setup ~draw ()
