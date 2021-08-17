(** {2 Two Dimensional Primitives} *)

val rect :
  ?sketch:Sketch.t ->
  ?tl:int ->
  ?tr:int ->
  ?br:int ->
  ?bl:int ->
  int ->
  int ->
  int ->
  int ->
  unit
(** [rect x y w h] draws a rectangle on the canvas. [h] is used for the height
    of the rectangle. [tl, tr, br, bl] specifies the radius of the top-left,
    top-right, bottom-right and bottom-left corners respectively. *)
