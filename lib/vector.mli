type t = private Ojs.t
(** The type of P5 Vectors *)

val t_to_js : t -> Ojs.t

val t_of_js : Ojs.t -> t

val create_vector : float -> float -> ?z:float -> unit -> t
  [@@js.global "createVector"]

val set : t -> float list -> unit
  [@@js.call]
(** Set the elements of a vector --
    {{:https://p5js.org/reference/#/p5.Vector/set} Ref} *)

val copy : t -> t [@@js.call]
(** Copy a vector to a new vector *)

val get_x : t -> float [@@js.get "x"]

val get_y : t -> float [@@js.get "y"]

val get_z : t -> float [@@js.get "z"]

val add : t -> t -> t [@@js.call]
(** Element-wise addition of two vectors *)

val sub : t -> t -> t [@@js.call]
(** Element-wise subtraction of two vectors *)

val mult : t -> float -> t
  [@@js.call]
(** [mult t s] scales a vector [t] by a scalar [s] *)

val rem : t -> t -> t [@@js.call]
(** Element-wise remainder of two vectors *)

val div : t -> float -> t
  [@@js.call]
(** [div t s] divides a vector [t] by a scalar [s] *)

val mag : t -> unit -> float
  [@@js.call]
(** [mag t ()] returns the magnitude of vector [t] *)

val mag_sq : t -> unit -> float
  [@@js.call "magSq"]
(** [mag_sq t ()] returns the magnitude squared of vector [t] *)

val dot : t -> t -> t
  [@@js.call]
(** [dot a b] calculates the dot-product of vectors [a] and [b] *)

val cross : t -> t -> t
  [@@js.call]
(** [cross a b] calculates the cross-product of vectors [a] and [b] *)

val normalize : t -> t
  [@@js.call]
(** Normalizes a vector -- gives it unit length *)

val limit : t -> float -> unit
  [@@js.call]
(** Like normalize but for a supplied limit *)

val set_mag : t -> float -> unit
  [@@js.call "setMag"]
(** [set_mag t len] sets the magnitude of [t] to [len] *)

val heading : t -> unit -> float
  [@@js.call]
(** Calculate the angle of rotation for a vector [t] *)

val rotate : t -> float -> unit
  [@@js.call]
(** [rotate t r] rotates a vector [t] by [r] *)

val angle_between : t -> t -> float
  [@@js.call "angleBetween"]
(** [angle_between a b] calculates the angle between [a] and [b] *)

val lerp : t -> float -> float -> float -> float -> unit
  [@@js.call]
(** [lerp v x y z amt] will linear interpolate [v] to [(x, y, z)] by [amt] where
    [0.0 <= amt <= 1.0] *)

val reflect : t -> t -> unit
  [@@js.call]
(** [reflect v n] reflects [v] about surface normal or line [n] *)

val array : t -> unit -> float array
  [@@js.call]
(** Return a float array representation of the vector *)

val equals : t -> t -> bool [@@js.call]
(** Equality check for vectors *)

module P5 : sig
  val from_angle : float -> float -> t
    [@@js.global]
  (** Produces a new vector from a given angle *)

  val from_angles : float -> float -> float -> t
    [@@js.global]
  (** [from_angles theta phi len] creates a 3D vector from a given angle *)

  val random_2D : unit -> t [@@js.global]
  (** A new random 2D vector *)

  val random_3D : unit -> t [@@js.global]
  (** A new random 3D vector *)
end [@js.scope "p5.Vector"]
