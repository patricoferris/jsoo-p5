open Js_of_ocaml

type t = int * int * int * int
(** The OCaml representation of color *)

type color
(** The JS returned color *)

type color_mode = RGB | HSB | HSL  (** The types of color modes *)

val color_mode : color_mode -> Js.Unsafe.top Js.t array -> unit
(** set the global color mode *)

val red : alpha:int -> t
(** [red ~alpha] is the color red with alpha transparency *)

val blue : alpha:int -> t
(** [blue ~alpha] is the color blue with alpha transparency *)

val green : alpha:int -> t
(** [green ~alpha] is the color green with alpha transparency *)

val color : int -> int -> int -> int -> color
(** [make r g b a] is the color [(r, g, b)] with [a] alpha transparency *)

val get_alpha : color -> int
(** [get_alpha c] returns the alpha of color [c] *)

val get_red : color -> int
(** [get_red c] returns the red of color [c] *)

val get_green : color -> int
(** [get_green c] returns the green of color [c] *)

val get_blue : color -> int
(** [get_blue c] returns the blue of color [c] *)

val fill : t -> unit
(** [fill t] calls the fill function with color [t] *)

val no_fill : unit -> unit
(** [no_fill ()] disables any filling of geometry *)
