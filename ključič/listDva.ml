(* a) *)
type ('a, 'b) list2 =
  | Nil
  | Cons1 of 'a * ('a, 'b) list2
  | Cons2 of 'b * ('a, 'b) list2 ;;

let capibara = Cons1(42, Cons2("cow", Cons2("capibara", Cons2("rabbit", Cons1(10,Nil)))));;

let rec length2 = function
  | Cons1 (a, b) -> 1 + length2 b
  | Cons2 (a, b) -> 1 + length2 b
  | Nil -> 0;;

length2 capibara;;

(* b) *)
let rec map2 f g = function
  | Cons1(a, b) -> Cons1(f a, map2 f g b)
  | Cons2(a,b) -> Cons2(g a, map2 f g b)
  | Nil -> Nil;;

map2 (fun a -> a < 20) (String.uppercase_ascii) capibara;;

(* c) *)
let split l =
  let rec splitter list left right = 
    match list with
    | Cons1(a, b) -> splitter b (List.append left [a]) right
    | Cons2(a, b) -> splitter b left (List.append right [a])
    | Nil -> (left, right)
  in
  splitter l [] [];;

split (Cons1("capibara", Nil));;
split (Cons2("capibara", Nil));;
split capibara;;
