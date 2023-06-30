(*
) (7 toˇck) V OCamlu definiramo podatkovni tip dreves:
type ’a drevo =
| List
| Plod of ’a
| Veja of ’a drevo
| Rogovila of ’a drevo * ’a drevo * ’a drevo
Sestaviti želimo funkcijo listje : ’a drevo -> int, ki prešteje liste v drevesu:
# listje List ;;
- : int = 1
# listje (Veja (Rogovila (Veja List, Rogovila
(Rogovila (List, Veja List, List), List, Veja List), Plod "oreh")))
- : int = 6
Dopolnite implementacijo funkcije listje:
*)


type 'a drevo =
 | List
 | Plod of 'a
 | Veja of 'a drevo
 | Rogovila of 'a drevo * 'a drevo * 'a drevo;;

let rec listje = function
  | List -> 1
  | Plod p -> 0
  | Veja v -> listje v
  | Rogovila (r1, r2, r3) -> listje r1 + listje r2 + listje r3;;

listje List ;;
listje  (Veja (Rogovila (Veja List, Rogovila (Rogovila (List, Veja List, List), List, Veja List), Plod "oreh")));;