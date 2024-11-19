open! Core
open! Core_unix
open! Dtime

let pretty_print time : unit =
  printf
    "Decimal time: %s\n"
    (if is_midnight time then "NEW" else Int.to_string (Float.to_int time))
;;

let () =
  let now = localtime (time ()) in
  let decimal = to_decimal now in
  pretty_print decimal
;;
