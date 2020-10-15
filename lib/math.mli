module Calc : sig
  val abs : float -> float
    [@@js.global]
  (** [abs f] returns the absolute value of [f] *)

  val ceil : float -> float
    [@@js.global]
  (** [ceil f] returns the ceiling value of [f] *)

  val constain : float -> float -> float -> float
    [@@js.global]
  (** [constrain n low high] will keep [n] between [low] and [high] *)

  val dist : float list -> float
  (** Returns the distance between two points --
      {{:https://p5js.org/reference/#/p5/dist} Ref} *)

  val exp : float -> float
    [@@js.global]
  (** [exp n] returns Euler's number raised to [n] *)

  val floor : float -> float [@@js.global]
  (** [floor n] floors [n] *)

  val lerp : float -> float -> float -> float
    [@@js.global]
  (** [lerp a b amt] linear interpolates between [a] and [b] by [amt] *)

  val log : float -> float
    [@@js.global]
  (** [log n] calculates the natural logarithm of [n] *)

  val mag : float -> float -> float
    [@@js.global]
  (** [mag a b] calculates the magnitudes of the vector (0, 0) to (a, b)*)

  val map : float -> float -> float -> float -> float -> float
    [@@js.global]
  (** [map v s1 f1 s2 f2] remaps a number [v] from one range [s1 - f1] to a new
      range [s2 - f2] *)

  val max : float list -> float
    [@@js.global]
  (** [max \[f1; f2...\]] finds the max element of the list *)

  val min : float list -> float
    [@@js.global]
  (** [min \[f1; f2...\]] finds the min element of the list *)

  val norm : float -> float -> float -> float
    [@@js.global]
  (** [norm v s f] normalises a number [v] from a range [s] to [f] *)

  val pow : float -> float -> float
    [@@js.global]
  (** [pow n e] raises [n] to [e] *)

  val round : float -> ?deci:(float[@js.default 0.]) -> unit -> float
    [@@js.global]
  (** [round x ()] will round [x], optionally specify to how many decimal places *)

  val sq : float -> float [@@js.global]
  (** [sq n] squares [n] *)

  val sqrt : float -> float
    [@@js.global]
  (** [sqrt n] takes the square root of [n] *)

  val fract : float -> float
    [@@js.global]
  (** Calculates the fractional part of a number *)
end

module Random : sig
  val random_seed : float -> unit [@@js.global]
  (** Set the random seed *)

  val random : float -> float -> float
    [@@js.global]
  (** [random a b] picks a random number between [a] and [b] *)

  val random_choices : float list -> float
    [@@js.global "random"]
  (** [random lst] will choose a random element of [lst] *)

  val random_gaussian : float -> float -> float
    [@@js.global]
  (** [random_gaussian mean sd] returns a random number generated from a
      Gaussian with mean [mean] and standard deviation [sd]*)
end

module Trig : sig
  type mode = Radians [@js "RADIANS"] | Degrees [@js "DEGREES"] [@@js.enum]

  val acos : float -> float [@@js.global]
  (** Calculates arccos of a number *)

  val asin : float -> float [@@js.global]
  (** Calculates arcsin of a number *)

  val atan : float -> float [@@js.global]
  (** Calculates atan of a number *)

  val atan2 : float -> float -> float
    [@@js.global]
  (** Calculates atan angle between two numbers --
      {{:https://p5js.org/reference/#/p5/atan2} Ref} *)

  val cos : float -> float [@@js.global]
  (** Calculates cos of a number *)

  val sin : float -> float [@@js.global]
  (** Calculates sin of a number *)

  val tan : float -> float [@@js.global]
  (** Calculates tan of a number *)

  val degrees : float -> float
    [@@js.global]
  (** Takes radians, gives you degrees *)

  val radians : float -> float
    [@@js.global]
  (** Takes degrees, gives you radians *)

  val angle_mode : mode -> unit
    [@@js.global]
  (** Set the angle mode to [Radians] or [Degrees] *)
end

module Noise : sig
  val noise :
    float ->
    ?y:(float[@js.default 0.]) ->
    ?z:(float[@js.default 0.]) ->
    unit ->
    float
    [@@js.global]
  (** {{:https://p5js.org/reference/#/p5/noise} Perlin Noise} *)

  val noise_detail : float -> float -> unit
    [@@js.global]
  (** [noise_detail oct fall] sets the octaves and the falloff factor for the
      {{:https://p5js.org/reference/#/p5/noiseDetail} noise} *)

  val noise_seed : float -> unit [@@js.global]
  (** Set the noise seed *)
end

module Constants : sig
  val pi : float [@@js.global "PI"]
end
