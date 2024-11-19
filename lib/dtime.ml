open! Core
open Core_unix

(* A very basic implementaiton of converting the systems monotonic clock to usable decimal
   minutes in a day.

   D = |1000 - (1000 * (H * 3600 + M * 60 + S) / 86400)|
*)

type decimal_time = float [@@deriving sexp, compare]

module T = struct
  type t = decimal_time [@@deriving sexp, compare]
end

include T
include Comparable.Make (T)

let[@inline] time_of_day_to_seconds (tm : Core_unix.tm) : int =
  let { tm_hour; tm_min; tm_sec; _ } = tm in
  (tm_hour * 3600) + (tm_min * 60) + tm_sec
;;

let[@inline] normalize_to_fraction (seconds : int) : float =
  let seconds_per_day : int = 24 * 60 * 60 in
  float_of_int seconds /. float_of_int seconds_per_day
;;

let to_decimal (time : Core_unix.tm) : decimal_time =
  let open Float.O in
  time
  |> time_of_day_to_seconds
  |> normalize_to_fraction
  |> ( * ) 1000.0
  |> fun x -> 1000.0 -. x |> Float.round
;;

(* Helper methods for time distinction *)

let is_midnight (time : t) : bool = equal time 1000.0
let is_teatime (time : t) : bool = equal time 333.0
let is_noon (time : t) : bool = equal time 500.0
