type t
(** The sketch. P5 works in two "modes", either taking from the global window
    object or by passing in a specific "sketch" instance to be used. The latter
    is more powerful and allows you to have multiple sketches in the window, the
    only downside is you have to pass the [sketch] to every single function
    call.

    Every function in this library has an option argument [?sketch] which if
    left out then the global instance is used, otherwise function calls will use
    that call. *)

val call : t option -> string -> Jv.t array -> Jv.t
(** Calls the method on the sketch instance if it exists or on the global
    instance if not *)

val get : t option -> string -> Jv.t

val run :
  ?sketch:t ->
  ?setup:(unit -> unit) ->
  ?draw:(unit -> unit) ->
  ?key_pressed:(unit -> unit) ->
  unit ->
  unit
(** Run your sketch *)

val with_sketch : ?id:string -> (t -> unit) -> unit
(** [with_sketch ?id fn] allows you to run p5.js in instance mode by providing
    you with a sketch object. The [id] can optionally specify the id of the
    parent container where the canvas will be created. *)
