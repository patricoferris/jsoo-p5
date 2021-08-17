let sin ?sketch angle =
  let angle = Jv.of_float angle in
  Sketch.call sketch "sin" [| angle |] |> Jv.to_float