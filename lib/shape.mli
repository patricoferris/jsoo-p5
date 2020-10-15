(* open Js_of_ocaml *)

module Primitives : sig
  module TwoD : sig
    val rect : float -> float -> float -> float -> unit
      [@@js.global]
    (** [rect x y w h] draws a rectangle at position [(x, y)] with width [w] and
        height [h] *)

    val ellipse : float -> float -> float -> float -> unit
      [@@js.global]
    (** [ellipse x y w h] draws an ellipse at position [(x, y)] with width [w]
        and height [h] *)

    val triangle : float -> float -> float -> float -> float -> float -> unit
      [@@js.global]
    (** [triangle x1 y1 x2 y2 x3 y3] draws a triangle with vertices at
        [(x1, y1)], [(x2, y2)] and [(x3, y3)]*)

    val line :
      float -> float -> float -> float -> (float list[@js.variadic]) -> unit
      [@@js.global]
    (** [line x1 y1 x2 y2] draws a line from [(x1, y1)] to [(x2, y2)] *)
  end

  module ThreeD : sig
    val plane : ?detail_x:int -> ?detail_y:int -> float -> float -> unit
      [@@js.global]
    (** [plane w h] will draw a plane with width [w] and height [h]. Optional
        [detail_] for amount of segments defaulting to 16 *)

    val box : ?detail_x:int -> ?detail_y:int -> float -> float -> float -> unit
      [@@js.global]
    (** [box w h d] will draw a box with width [w], height [h] and depth [d].
        Optional [detail_] for amount of segments defaulting to 16 *)

    val sphere : ?detail_x:int -> ?detail_y:int -> float -> unit
      [@@js.global]
    (** [sphere r] will draw a sphere with radius [r]. Optional [detail_] for
        amount of segments defaulting to 16 *)

    val cylinder :
      ?detail_x:int ->
      ?detail_y:int ->
      ?bot_cap:bool ->
      ?top_cap:bool ->
      float ->
      float ->
      unit
      [@@js.global]
    (** [cylinder r h] will draw a cylinder with radius [r] and height [h].
        Optional [detail_] for amount of segments defaulting to 16. Optional
        [_cap] for disabling the caps on either end of the cylinder. *)

    val cone :
      ?detail_x:int -> ?detail_y:int -> ?cap:bool -> float -> float -> unit
      [@@js.global]
    (** [cone r h] will draw a cone with radius [r] and height [h]. Optional
        [detail_] for amount of segments defaulting to 16. Optional [cap] to
        disable the capping of the cone.*)

    val ellipsoid :
      ?detail_x:int -> ?detail_y:int -> float -> float -> float -> unit
      [@@js.global]
    (** [ellipsoid rx ry rz] will draw an ellipsoid with x-radius [rx], y-radius
        [ry] and z-radius [rz]. Optional [detail_] for amount of segments
        defaulting to 16. *)

    val torus : ?detail_x:int -> ?detail_y:int -> float -> float -> unit
      [@@js.global]
    (** [torus r tube] will draw a torus with outer radius [r] and inner radius
        [tube]. Optional [detail_] for amount of segments defaulting to 16. *)

    val line : float -> float -> float -> float -> float -> float -> unit
      [@@js.global]
    (** [line x1 y1 z1 x2 y2 z2] draws a line from [(x1, y1, z1)] to
        [(x2, y2, z2)] *)
  end
end

module Curves : sig
  val bezier : (float list[@js.variadic]) -> unit
    [@@js.global]
  (** [bezier points] draws a bezier curve. List of parameters can be seen
      {{:https://p5js.org/reference/#/p5/bezier} here}*)

  val bezier_detail : int -> unit
    [@@js.global]
  (** Sets the resolution of the Bezier curve -- default is 20 *)

  val bezier_point : float -> float -> float -> float -> float -> float
    [@@js.global]
  (** [bezier_point a b c d t] Given x or y co-ordinate values of control and
      anchor points of a bezier, it calculates the x or y coordinate of the
      bezier at position [t] *)

  val bezier_tangent : float -> float -> float -> float -> float -> float
    [@@js.global]
  (** Evaluates the tangent to the Bezier at position t for points a, b, c, d --
      {{:https://p5js.org/reference/#/p5/bezierTangent} Ref} *)

  val curve : (float list[@js.variadic]) -> unit
    [@@js.global]
  (** Draws a curve between two points --
      {{:https://p5js.org/reference/#/p5/curve} Ref}*)

  val curve_detail : int -> unit
    [@@js.global]
  (** Sets the resolution of the curve -- default is 20 and min of 3 *)

  val curve_tightness : int -> unit
    [@@js.global]
  (** Sets how tight the curve fits to the vertex points -- default is 0.0 *)

  val curve_tangent : float -> float -> float -> float -> float -> float
    [@@js.global]
  (** Evaluates the curve tangent at position t for points a, b, c, d--
      {{:https://p5js.org/reference/#/p5/curveTangent} Ref} *)

  val curve_point : float -> float -> float -> float -> float -> float
    [@@js.global]
  (** Evaluates the curve at position t for points a, b, c, d--
      {{:https://p5js.org/reference/#/p5/curvePoint} Ref} *)
end

module Vertex : sig
  val begin_contour : unit -> unit
    [@@js.global]
  (** Start a contour -- {{:https://p5js.org/reference/#/p5/beginContour} Ref}*)

  val end_contour : unit -> unit
    [@@js.global]
  (** End a contour -- {{:https://p5js.org/reference/#/p5/endContour} Ref}*)

  val bezier_vertex : float list -> unit
    [@@js.global]
  (** Specifies vertex coordinates for Bezier curves --
      {{:https://p5js.org/reference/#/p5/bezierVertex} Ref}*)

  val curve_vertex : ?z:(float[@js.default 0.]) -> float -> float -> unit
    [@@js.global]
  (** [curve_vertex x y] specifies vertex coordinates for curves --
      {{:https://p5js.org/reference/#/p5/curveVertex} Ref}*)

  val begin_shape : unit -> unit
    [@@js.global "beginShape"]
  (** [begin_shape] starts recording the vertices for more complex shapes --
      {{:https://p5js.org/reference/#/p5/beginShape} Ref} *)

  val end_shape : unit -> unit
    [@@js.global "endShape"]
  (** [begin_shape] stops recording the vertices for more complex shapes --
      {{:https://p5js.org/reference/#/p5/endShape} Ref} *)

  val vertex : Vector.t -> unit
    [@@js.global "vertex"]
  (** [vertex x y] creates a new vertex at [x] and [y], optionally specify the
      [z] coordinate *)

  val stroke : float -> float -> float -> unit [@@js.global]
end
