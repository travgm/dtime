open Dtime

let () =
  let now = Unix.localtime (Core_unix.time ()) in
  let decimal = to_decimal now in
  Printf.printf
    "Decimal time: %s\n"
    (if is_midnight decimal then "NEW" else string_of_int (int_of_float decimal))
;;
