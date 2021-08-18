type t
(** The type for colours *)

(** {2 Makers} *)

val make : ?sketch:Sketch.t -> ?alpha:int -> int -> int -> int -> t
(** [make r g b] creates a new colour using the values for [r, g, b]. You can
    also provide an optional alpha value. *)

val make_gray : ?sketch:Sketch.t -> ?alpha:int -> int -> t
(** [make v] creates a new colour using [v] for the [r, g, b] values. *)

val make_string : ?sketch:Sketch.t -> string -> t
(** Making a colour with a string. The {{:https://p5js.org/reference/#/p5/color}
    p5 reference} explains in detail what can and cannot be passed as an
    argument here.*)

(** {2 Accessors} *)

val alpha : ?sketch:Sketch.t -> t -> int
(** [alpha c] extracts the alpha value from a colour *)

val blue : ?sketch:Sketch.t -> t -> int
(** [blue c] extracts the blue value from a colour *)

val brightness : ?sketch:Sketch.t -> t -> int
(** [brightness c] extracts the HSB brightness value from a colour *)

val green : ?sketch:Sketch.t -> t -> int
(** [green c] extracts the green value of a colour *)

val hue : ?sketch:Sketch.t -> t -> int
(** [hue c] extracts the HSB hue value from a colour *)

val lightness : ?sketch:Sketch.t -> t -> int
(** [lightness c] extracts the HSL lightness value from a colour *)

val red : ?sketch:Sketch.t -> t -> int
(** [red c] extracts the red value from a colour *)

val saturation : ?sketch:Sketch.t -> t -> int
(** [saturation c] extracts the HSL saturation value from a colour *)

(** {2 Mutators} *)

val set_green : t -> int -> unit
(** [set_green c v] sets the green component of the colour [c] to value [v] *)

val set_red : t -> int -> unit
(** [set_red c v] sets the red component of the colour [c] to value [v] *)

val set_blue : t -> int -> unit
(** [set_blue c v] sets the blue component of the colour [c] to value [v] *)

val set_alpha : t -> int -> unit
(** [set_alpha c v] sets the alpha component of the colour [c] to value [v] *)

val to_string : t -> Jstr.t
(** [to_string c] converts the colour [c] to a string *)

(** {2 Useful Functions} *)

val lerp_color : ?sketch:Sketch.t -> t -> t -> float -> t
(** [lerp_color c1 c2 amt] interpolates ("mixes") two colours [c1] and [c2] by
    an amount specified by [amt]. *)

(** {2 Settings} *)

val background : ?sketch:Sketch.t -> t -> unit
(** [background c] sets the canvas' background colour to [c] *)

val background_image : ?sketch:Sketch.t -> Image.t -> unit
(** [background img] sets the canvas' background to the {!Image.t} [img] *)

val clear : ?sketch:Sketch.t -> unit -> unit
(** Clears the buffer *)

type mode =
  | RGB
  | HSB
  | HSL  (** Types to represent the different colour modes *)

val color_mode : ?sketch:Sketch.t -> ?max:int -> mode -> unit
(** [color_mode ?max mode] sets the colour mode and the range for all values *)

val color_mode_with_max :
  ?sketch:Sketch.t ->
  ?max_alpha:int ->
  max_1:int ->
  max_2:int ->
  max_3:int ->
  mode ->
  unit
(** Same as {!color_mode} but gives you more control over each of the ranges for
    a particular [mode] *)

val fill : ?sketch:Sketch.t -> t -> unit
(** [fill c] sets the colour to be used to fill shapes *)

val no_fill : ?sketch:Sketch.t -> unit -> unit
(** Disables filling geometry *)

val stroke : ?sketch:Sketch.t -> t -> unit
(** [stroke c] sets the colour used to draw lines and borders around shapes *)

val no_stroke : ?sketch:Sketch.t -> unit -> unit
(** [no_stroke ()] disables drawing the outline *)

val erase :
  ?sketch:Sketch.t -> ?fill_strength:int -> ?stroke_strength:int -> unit -> unit
(** [erase ()] causes all subsequent draws to subtract from the canvas.
    [fill_strength] and [stroke_strength] will control how much the two
    properties will be erased. By default they are [255] i.e. full strength *)

val no_erase : ?sketch:Sketch.t -> unit -> unit
(** [no_erase ()] ends erasing that was started with {!erase} *)
