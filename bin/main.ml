open Dtime

let () =
  let now = Unix.localtime (Core_unix.time ()) in
  let decimal = to_decimal now in
  Printf.printf "Decimal time: %d\n" (int_of_float decimal)
;;
