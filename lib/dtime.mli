open Core
open Core_unix;;

type decimal_time = float [@@deriving sexp, compare]
type t = decimal_time [@@deriving sexp, compare]

include Comparable.S with type t := t

val to_decimal : tm -> float
val is_midnight : t -> bool
val is_noon : t -> bool
val is_teatime : t -> bool
