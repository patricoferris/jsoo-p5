(** {2 Two Dimensional Primitives} *)

val rect :
  ?sketch:Sketch.t ->
  ?tl:float ->
  ?tr:float ->
  ?br:float ->
  ?bl:float ->
  float ->
  float ->
  float ->
  float ->
  unit
(** [rect x y w h] draws a rectangle on the canvas. [h] is used for the height
    of the rectangle. [tl, tr, br, bl] specifies the radius of the top-left,
    top-right, bottom-right and bottom-left corners respectively. *)

val line_2d :
  ?sketch:Sketch.t ->
  x1:float ->
  y1:float ->
  x2:float ->
  y2:float ->
  unit ->
  unit
(** Create a line from [x1, y1] to [x2, y2] (optionally pass z values for
    three-dimensional lines) *)

val line_3d :
  ?sketch:Sketch.t ->
  x1:float ->
  y1:float ->
  z1:float ->
  x2:float ->
  y2:float ->
  z2:float ->
  unit ->
  unit
(** Create a line from [x1, y1] to [x2, y2] (optionally pass z values for
    three-dimensional lines) *)

val ellipse :
  ?sketch:Sketch.t -> ?detail:int -> float -> float -> float -> float -> unit
(** [ellipse x y w h] creates an ellipse, the [detail] option is for WebGL mode
    only *)
(*
   type arc_mode = Chord | Pie | Open

   val arc :
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
