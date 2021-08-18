let rect ?sketch ?tl ?tr ?br ?bl x y w h =
  let x = Jv.of_float x in
  let y = Jv.of_float y in
  let w = Jv.of_float w in
  let h = Jv.of_float h in
  let tl = Jv.of_option ~none:Jv.null Jv.of_float tl in
  let tr = Jv.of_option ~none:Jv.null Jv.of_float tr in
  let br = Jv.of_option ~none:Jv.null Jv.of_float br in
  let bl = Jv.of_option ~none:Jv.null Jv.of_float bl in
  Sketch.call sketch "rect" [| x; y; w; h; tl; tr; br; bl |] |> ignore

let line_2d ?sketch ~x1 ~y1 ~x2 ~y2 () =
  let x1 = Jv.of_float x1 in
  let y1 = Jv.of_float y1 in
  let x2 = Jv.of_float x2 in
  let y2 = Jv.of_float y2 in
  Sketch.call sketch "line" [| x1; y1; x2; y2 |] |> ignore

let line_3d ?sketch ~x1 ~y1 ~z1 ~x2 ~y2 ~z2 () =
  let x1 = Jv.of_float x1 in
  let y1 = Jv.of_float y1 in
  let z1 = Jv.of_float z1 in
  let x2 = Jv.of_float x2 in
  let y2 = Jv.of_float y2 in
  let z2 = Jv.of_float z2 in
  Sketch.call sketch "line" [| x1; y1; z1; x2; y2; z2 |] |> ignore

let ellipse ?sketch ?detail x y w h =
  let x = Jv.of_float x in
  let y = Jv.of_float y in
  let w = Jv.of_float w in
  let h = Jv.of_float h in
  let detail = Jv.of_option ~none:Jv.null Jv.of_int detail in
  Sketch.call sketch "ellipse" [| x; y; w; h; detail |] |> ignore

(* type arc_mode = Chord | Pie | Open *)

(* val arc :
     ?sketch:Sketch.t ->
     ?mode:arc_mode ->
     ?detail:int ->
     float ->
     float ->
     float ->
     float ->
     unit
   (** [arc x y w h] draws an arc, [detail] is the same as {!ellipse}. The
       {!arc_mode} can be [Pie] meaning it will be filled as a closed pie segment,
       [Chord] so closed like a semi-cicle or [Open] like an open-semicircle. *)

   val point : ?sketch:Sketch.t -> ?z:float -> float -> float -> unit
   (** [point x y] is the point at [x, y] *)

   val point_v : ?sketch:Sketch.t -> Vector.t -> unit
   (** Same as {!point} but using a {!Vector.t} *)

   val quad :
     ?sketch:Sketch.t ->
     ?detail_x:int ->
     ?detail_y:int ->
     ?z1:float ->
     ?z2:float ->
     ?z3:float ->
     ?z4:float ->
     x1:float ->
     y1:float ->
     x2:float ->
     y2:float ->
     x3:float ->
     y3:float ->
     x4:float ->
     y4:float ->
     unit ->
     unit
   (** Like a {!rect} but you specify all the vertices with optional z values *)

   val triangle :
     ?sketch:Sketch.t ->
     x1:float ->
     y1:float ->
     x2:float ->
     y2:float ->
     x3:float ->
     y3:float ->
     unit
   * Draw a triangle by specifying the vertices *)
