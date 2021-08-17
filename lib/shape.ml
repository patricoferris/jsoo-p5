
let rect ?sketch ?tl ?tr ?br ?bl x y w h =
  let x = Jv.of_int x in
  let y = Jv.of_int y in
  let w = Jv.of_int w in
  let h = Jv.of_int h in
  let tl = Jv.of_option ~none:Jv.null Jv.of_int tl in 
  let tr = Jv.of_option ~none:Jv.null Jv.of_int tr in 
  let br = Jv.of_option ~none:Jv.null Jv.of_int br in 
  let bl = Jv.of_option ~none:Jv.null Jv.of_int bl in 
    Sketch.call sketch "rect" [| x; y; w; h; tl; tr; br; bl |] |> ignore