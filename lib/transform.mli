type mat
(** type of 3x3 matrices *)

type vec
(** type of 3x1 vectors *)

val mk_mat : float -> float -> float -> float -> float -> float -> mat
(** [mk_mat a b c d e f] makes a 3x3 matrix with the first row [a, b, c], second
    row [d, e, f] and the last row [0., 0., 1.]*)

val apply_matrix : mat -> unit
(** [apply_matrix m] multiplies the current matrix by the supplied one*)

val reset_matrix : unit -> unit
(** [reset_matrix ()] will reset the current matrix to be the identity matrix *)

val rotate : ?around:vec -> float -> unit
(** [rotate ~around by] will rotate the current matrix by [by] amount using
    [around] axis *)

val rotate_x : float -> unit
(** [rotate_x by] will rotate the current matrix by [by] amount around the
    x-axis *)

val rotate_y : float -> unit
(** [rotate_y by] will rotate the current matrix by [by] amount around the
    y-axis *)

val rotate_z : float -> unit
(** [rotate_z by] will rotate the current matrix by [by] amount around the
    z-axis *)

val scale : ?y:float -> float -> unit
(** [scale ~y s] will increase or decrease the size of a shape by expanding or
    contracting vertices -- [y] will specify how much in the [y] axis *)

val shear_x : float -> unit
(** [shear_x ang] will shear a shape around the x-axis by the amount specified
    by the [ang] *)

val shear_y : float -> unit
(** [shear_y ang] will shear a shape around the y-axis by the amount specified
    by the [ang] *)

val translate : ?z:float -> float -> float -> unit
(** [translate x y ~z] translate the current matrix by a vector [x, y, z] -- [z]
    defaults to [0] *)
