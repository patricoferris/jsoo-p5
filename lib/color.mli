type mode = HSB [@js "hsb"] | RGB [@js "rgb"] [@@js.enum]

val color_mode : mode -> unit [@@js.global]

val background : int -> int -> int -> unit [@@js.global]

val no_fill : unit -> unit [@@js.global]
