(*
Zapišite kakršenkoli modul A, ki ustreza signaturi
module type CHANNEL =
sig
type t
val init : unit -> t
val write : t -> string -> unit
val read : t -> string
end
Odgovor:
module A : CHANNEL =
struct

*)

module type CHANNEL =
sig
  type t
  val init : unit -> t
  val write : t -> string -> unit
  val read : t -> string
end;;

module A : CHANNEL = 
struct
  type t = Random_T
  let init () = Random_T
  let write Random_T "write" = ()
  let read Random_T = "read"
end