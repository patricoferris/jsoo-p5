open P5

let setup () =
  Canvas.create 800 800 |> ignore

let draw () =
  Color.fill (Color.make 255 0 0);
  Shape.rect 50 50 50 50

let () =
  Sketch.run ~setup ~draw ();
  Brr.Console.log [ "HELO" ]