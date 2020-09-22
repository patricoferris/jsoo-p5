open Js_of_ocaml

let global_call ~func ~args =
  Js.Unsafe.(meth_call global (js_expr func) [| inject args |])

let func ~f ~args = Js.Unsafe.(fun_call (eval_string f) args)
