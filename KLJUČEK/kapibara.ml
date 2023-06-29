(* 3. naloga (30 točk)
Sezname običajno definiramo tako, da so vsi elementi istega tipa. Lahko pa bi imeli mešane
sezname, ki vsebujejo elemente dveh tipov. V Haskellu bi tip definirali kot
data List2 a b = Nil | Cons1 a (List2 a b) | Cons2 b (List2 a b)
in v OCamlu kot
type (’a, ’b) list2 =
| Nil
| Cons1 of ’a * (’a, ’b) list2
| Cons2 of ’b * (’a, ’b) list2
V nadaljevanju bomo uporabili Haskell, lahko pa nalogo rešujete tudi v OCamlu. Na primer,
mešani seznam celih števil in nizov [42, cow, 10, capibara,rabbit, 10] predstavimo kot
capibara = Cons1 42 (Cons2 "cow"
(Cons2 "capibara" (Cons2 "rabbit" (Cons1 10 Nil))))
*)

type 'a 'b list2 =
  | Nil
  | Cons1 of 'a * ('a, 'b) list2
  | Cons2 of 'b * ('a, 'b) list2

(*
a) (10 točk) Sestavite funkcijo
length2 :: List2 a b -> Int
ki vrne dolžino seznama. Primer:
> length2 capibara
5   
*)

let rec length2 lst =
  match lst with
  | Nil -> 0
  | Cons1 (_, tail) -> 1 + length2 tail
  | Cons2 (_, tail) -> 1 + length2 tail

(* b) Definicija funkcije `map2` *)
(* b) (10 točk) Sestavite funckijo
map2 :: (a -> b) -> (c -> d) -> List2 a b -> List2 c d
ki sprejme funkciji f in g ter ju uporabi na elementih mešanega seznama. Primer (funkcija
toUpper je v modulu Data.Char):
> map2 (\x -> x < 20) (map toUpper) capibara
Cons1 False (Cons2 "COW" (Cons2 "CAPIBARA" (Cons2 "RABBIT" (Cons1 True Nil))))
 *)

let rec map2 f g lst =
  match lst with
  | Nil -> Nil
  | Cons1 (head, tail) -> Cons1 (f head, map2 f g tail)
  | Cons2 (head, tail) -> Cons2 (g head, map2 f g tail)

(* c) (10 točk) Sestavite funkcijo
split :: List2 a b -> ([a], [b])
ki sprejme mešani seznam in ga razdeli na dva običajna seznama. Primeri:
> split (Cons1 "capibara" Nil)
(["capibara"], [])
> split (Cons2 "capibara" Nil)
([], ["capibara"])
> split capibara
([42, 10], ["cow", "capibara", "rabbit"])
 *)
let rec split lst =
  match lst with
  | Nil -> ([], [])
  | Cons1 (head, tail) -> let (l1, l2) = split tail in (head :: l1, l2)
  | Cons2 (head, tail) -> let (l1, l2) = split tail in (l1, head :: l2)
