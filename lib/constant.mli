(** Enums for how to draw things *)
type kind =
  | Points [@js "POINTS"]
  | Lines [@js "LINES"]
  | Triangles [@js "TRIANGLES"]
  | Triangle_fan [@js "TRIANGLE_FAN"]
  | Quads [@js "QUADS"]
  | Quad_strip [@js "QUAD_STRIP"]
  | Tess [@js "TESS"]
  | Close [@js "CLOSE"]
[@@js.enum]

val kind_to_js : kind -> Ojs.t

val kind_of_js : Ojs.t -> kind
