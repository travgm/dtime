open! Core
open Core_unix

let empty_tm =
  { Core_unix.tm_sec = 0
  ; tm_min = 0
  ; tm_hour = 0
  ; tm_mday = 1
  ; tm_mon = 0
  ; tm_year = 0
  ; tm_wday = 0
  ; tm_yday = 0
  ; tm_isdst = false
  }
;;

let%test_module "Dtime" =
  (module struct
    let%test_unit "test noon conversion" =
      let noon = { empty_tm with tm_hour = 12; tm_min = 0; tm_sec = 0 } in
      let result = Dtime.to_decimal noon in
      [%test_result: float] ~expect:500.0 result
    ;;

    let%test_unit "test midnight conversion" =
      let midnight = { empty_tm with tm_hour = 0; tm_min = 0; tm_sec = 0 } in
      let result = Dtime.to_decimal midnight in
      [%test_result: float] ~expect:1000.0 result
    ;;
  end)
;;
