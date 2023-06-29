(*
V OCamlu sestavite še funkcijo
moznosti : char list list -> int list -> char list list
ki deluje podobno kot predikat moznosti iz prejšnje naloge. Funkcija sprejme seznam veljavnih
besed besede in zaporedje števk stevke ter vrne seznam tistih besed iz besede, ki bi jih lahko
dobili s števkami stevke. V pomoˇc naj vam bo asociativni seznam
let tipke : (char * int) list = [
(’a’,2); (’b’,2); (’c’,2);
(’d’,3); (’e’,3); (’f’,3);
(’g’,4); (’h’,4); (’i’,4);
(’j’,5); (’k’,5); (’l’,5);
(’m’,6); (’n’,6); (’o’,6);
(’p’,7); (’q’,7); (’r’,7); (’s’,7);
(’t’,8); (’u’,8); (’v’,8);
(’w’,9); (’x’,9); (’y’,9); (’z’,9)]
Primer uporabe:
# moznosti
[[’o’;’r’;’e’;’l’];[’o’;’p’;’i’;’c’;’a’];[’o’;’s’;’e’;’l’];[’r’;’i’;’b’;’a’]]
[6;7;3;5] ;;
- : char list list = [[’o’; ’r’; ’e’; ’l’]; [’o’; ’s’; ’e’; ’l’]]
   
*)

let tipke : (char * int) list = [
('a',2); ('b',2); ('c',2);
('d',3); ('e',3); ('f',3);
('g',4); ('h',4); ('i',4);
('j',5); ('k',5); ('l',5);
('m',6); ('n',6); ('o',6);
('p',7); ('q',7); ('r',7); ('s',7);
('t',8); ('u',8); ('v',8);
('w',9); ('x',9); ('y',9); ('z',9)]



let rec cvs crka lst = 
  match lst with 
  | [] -> None
  | (tipka,y) :: t -> if tipka = crka then Some y else cvs crka t

let rec bvs beseda listek =
  match beseda, listek with
  | [], [] -> true
  | bh :: bt, lh :: lt -> 
      (match cvs bh tipke with
      | Some x -> if x = lh then bvs bt lt else false
      | None -> false)
  | _ -> false

let moznosti seznam stevilke  =
  let rec bla seznam stevilke acc =

    match seznam with
    | [] -> acc
    | sh :: st -> 
      (
      if bvs sh stevilke 
      then bla st stevilke (sh :: acc)
      else bla st stevilke acc
      )
    in 
    List.rev ( bla seznam stevilke [])
    
