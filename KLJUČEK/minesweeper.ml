(*
2. naloga (35 toˇck)
Andrej je v OCamlu programiral razliˇcico klasiˇcne igrice Minesweeper. Igra poteka na minskem polju, v katerem položaje min in igralca predstavimo s celoštevilskimi koordinatami(x, y).
Igralec mora z zaporedjem korakov “dol”, “gor”, “levo” in “desno” prispeti od danega zaˇcetnega položaja do konˇcnega, ne da bi stopil na mino. Korake predstavimo s podatkovnim
tipom
type korak = Dol | Gor | Levo | Desno
a) (15) Sestavite funkcijo premik : int*int -> korak -> int*int, ki sprejme trenutni položaj in korak ter vrne naslednji položaj. Primeri:
# premik (0,3) Dol ;;
- : int * int = (0, 2)
# premik (0,3) Levo ;;
- : int * int = (-1, 3)   
*)
type korak = Dol | Gor | Levo | Desno;;
let korakec (x,y) korak = 
  match korak with
  | Dol -> (x, y - 1)
  | Gor -> (x, y + 1)
  | Levo -> (x - 1, y)
  | Desno -> (x + 1, y);;

(*
b) (20) Sestavite funkcijo
varna_pot : (int*int) list -> int*int -> int*int -> korak list -> bool
ki sprejme seznam položajev min, zaˇcetni položaj, konˇcni položaj in seznam korakov. Funkcija
vrne true, ˇce dani seznam korakov vodi od zaˇcetnega do konˇcnega položaja po poti, ki ne
vsebuje mine. Primeri:
# varna_pot [] (0,0) (2,3) [Gor; Desno; Gor; Desno; Gor] ;;
- : bool = true
# varna_pot [(1,1)] (0,0) (2,3) [Gor; Desno; Gor; Desno; Gor] ;;
- : bool = false
# varna_pot [(0,2); (1,0); (1,3); (2,1)] (0,0) (2,3)
[Gor; Desno; Gor; Desno; Gor] ;;
- : bool = true
Za vse toˇcke naj bo funkcija repno rekurzivna.
   
*)

let rec varna_pot mine (x,y) (z,w) koraki =
  if not (List.mem (x,y) mine) then
    match koraki with
    | [] -> true
    | h :: t -> varna_pot mine (korakec (x,y) h) (z,w) t
  else
    false;;
    
    