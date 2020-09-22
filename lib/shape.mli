(* open Js_of_ocaml *)

module Primitives : sig
  type t
  (** The type of primitives *)

  val rect : float -> float -> float -> float -> unit
  (** [rect x y w h] draws a rectangle at position [(x, y)] with width [w] and
      height [h] *)

  val ellipse : float -> float -> float -> float -> unit
  (** [ellipse x y w h] draws an ellipse at position [(x, y)] with width [w] and
      height [h] *)

  val triangle : float -> float -> float -> float -> float -> float -> unit
  (** [triangle x1 y1 x2 y2 x3 y3] draws a triangle with vertices at [(x1, y1)],
      [(x2, y2)] and [(x3, y3)]*)

  val line_2d : float -> float -> float -> float -> unit
  (** [line_2d x1 y1 x2 y2] draws a line from [(x1, y1)] to [(x2, y2)] *)

  val line_3d : float -> float -> float -> float -> float -> float -> unit
  (** [line_3d x1 y1 z1 x2 y2 z2] draws a line from [(x1, y1, z1)] to
      [(x2, y2, z2)] *)
end
