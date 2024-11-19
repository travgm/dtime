(** A very simple implementation of localtime conversion to usable decimal time left in a day *)

open Core

open Core_unix

type decimal_time = float [@@deriving sexp, compare]
type t = decimal_time [@@deriving sexp, compare]

include Comparable.S with type t := t

(** [to_decimal : tm -> float] converts localtime to decimal time. NOTE: it returns a float not int *)
val to_decimal : tm -> float

(** [is_midnight : t -> bool] checks if decimal time is midnight *)
val is_midnight : t -> bool

(** [is_noon : t -> bool] checks if decimal time is noon *)
val is_noon : t -> bool

(** [is_teatime : t -> bool] checks if decimal time is tea time *)
val is_teatime : t -> bool
