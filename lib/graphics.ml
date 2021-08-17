module Canvas = struct
  type t

  let create ?sketch ?renderer w h =
    let renderer = Jv.of_option ~none:Jv.null Jv.Id.to_jv renderer in
    Sketch.call sketch "createCanvas" [| Jv.of_int w; Jv.of_int h; renderer |]
end