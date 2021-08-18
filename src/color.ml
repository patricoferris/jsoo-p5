type t = Jv.t

let make ?sketch ?alpha r g b =
  let r = Jv.of_int r in
  let g = Jv.of_int g in
  let b = Jv.of_int b in
  let a = Jv.of_option ~none:Jv.null Jv.of_int alpha in
  Sketch.call sketch "color" [| r; g; b; a |]

let make_gray ?sketch ?alpha v =
  let v = Jv.of_int v in
  let a = Jv.of_option ~none:Jv.null Jv.of_int alpha in
  Sketch.call sketch "color" [| v; a |]

let make_string ?sketch s =
  let v = Jv.of_string s in
  Sketch.call sketch "color" [| v |]

let alpha ?sketch c = Sketch.call sketch "alpha" [| c |] |> Jv.to_int

let blue ?sketch c = Sketch.call sketch "blue" [| c |] |> Jv.to_int

let brightness ?sketch c = Sketch.call sketch "brightness" [| c |] |> Jv.to_int

let green ?sketch c = Sketch.call sketch "green" [| c |] |> Jv.to_int

let hue ?sketch c = Sketch.call sketch "hue" [| c |] |> Jv.to_int

let lightness ?sketch c = Sketch.call sketch "lightness" [| c |] |> Jv.to_int

let red ?sketch c = Sketch.call sketch "red" [| c |] |> Jv.to_int

let saturation ?sketch c = Sketch.call sketch "saturation" [| c |] |> Jv.to_int

(** {2 Mutators} *)

let set_green c v = Jv.call c "setGreen" [| Jv.of_int v |] |> ignore

let set_red c v = Jv.call c "setRed" [| Jv.of_int v |] |> ignore

let set_blue c v = Jv.call c "setBlue" [| Jv.of_int v |] |> ignore

let set_alpha c v = Jv.call c "setAlpha" [| Jv.of_int v |] |> ignore

let to_string c = Jv.call c "toString" [||] |> Jv.to_jstr

let lerp_color ?sketch c1 c2 amt =
  let amt = Jv.of_float amt in
  Sketch.call sketch "lerpColor" [| c1; c2; amt |]

let background ?sketch c = Sketch.call sketch "background" [| c |] |> ignore

let background_image ?sketch image =
  Sketch.call sketch "background" [| Image.to_jv image |] |> ignore

let clear ?sketch () = Sketch.call sketch "clear" [||] |> ignore

type mode =
  | RGB
  | HSB
  | HSL  (** Types to represent the different colour modes *)

let mode_to_jv = function
  | RGB -> Constants.rgb
  | HSB -> Constants.hsb
  | HSL -> Constants.hsl

let color_mode ?sketch ?max mode =
  let max = Jv.of_option ~none:Jv.null Jv.of_int max in
  Sketch.call sketch "colorMode" [| mode_to_jv mode; max |] |> ignore

let color_mode_with_max ?sketch ?max_alpha ~max_1 ~max_2 ~max_3 mode =
  let max1 = Jv.of_int max_1 in
  let max2 = Jv.of_int max_2 in
  let max3 = Jv.of_int max_3 in
  let max = Jv.of_option ~none:Jv.null Jv.of_int max_alpha in
  Sketch.call sketch "colorMode" [| mode_to_jv mode; max1; max2; max3; max |]
  |> ignore

let fill ?sketch t = Sketch.call sketch "fill" [| t |] |> ignore

let no_fill ?sketch () = Sketch.call sketch "noFill" [||] |> ignore

let stroke ?sketch t = Sketch.call sketch "stroke" [| t |] |> ignore

let no_stroke ?sketch () = Sketch.call sketch "noStroke" [||] |> ignore

let erase ?sketch ?fill_strength ?stroke_strength () =
  let fill = Jv.of_option ~none:Jv.null Jv.of_int fill_strength in
  let stroke = Jv.of_option ~none:Jv.null Jv.of_int stroke_strength in
  Sketch.call sketch "erase" [| fill; stroke |] |> ignore

let no_erase ?sketch () = Sketch.call sketch "noErase" [||] |> ignore
