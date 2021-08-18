module Keyboard = struct
  type t = int

  let left_arrow = 37

  let right_arrow = 39

  let backspace = 8

  let delete = 46

  let enter = 13

  let return = 13

  let tab = 9

  let escape = 27

  let shift = 16

  let control = 17

  let option = 18

  let alt = 18

  let up_arrow = 38

  let down_arrow = 40

  let key_code ?sketch () = Sketch.get sketch "keyCode" |> Jv.to_int

  let is_down ?sketch t =
    Sketch.call sketch "keyIsDown" [| Jv.of_int t |] |> Jv.to_bool
end
