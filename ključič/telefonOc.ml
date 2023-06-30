let tipke : (char * int) list = [
('a',2); ('b',2); ('c',2);
('d',3); ('e',3); ('f',3);
('g',4); ('h',4); ('i',4);
('j',5); ('k',5); ('l',5);
('m',6); ('n',6); ('o',6);
('p',7); ('q',7); ('r',7); ('s',7);
('t',8); ('u',8); ('v',8);
('w',9); ('x',9); ('y',9); ('z',9)];;

(* moznosti : char list list -> int list -> char list list *)

(* moznosti [['o';'r';'e';'l'];['o';'p';'i';'c';'a'];['o';'s';'e';'l'];['r';'i';'b';'a']] *)
let findNumber t tipka =
  let rec printTipke t tipka = 
    match t with
    | [] -> -1
    | (c, n)::tail ->
      if tipka = c then
        n
      else
        printTipke tail tipka
  in
  printTipke t tipka;;

let printList list = 
  let rec printListAux list out = 
    match list with
    | [] -> out
    | head::body ->
      begin
        (* print_char head; *)
        let res = findNumber tipke head in
        printListAux body (out @ [res])
      end
  in
  printListAux list [];;
    
let rec cmp l1 l2 =
  match (l1, l2) with
  | [], [] -> 0
  | [], _ -> -1
  | _, [] -> 1
  |(h1::t1), (h2::t2) -> if h1 > h2 then 1
  else if h1 < h2 then -1
  else cmp t1 t2;;

let moznosti list numbers = 
  let rec moznostiAux l n finalOut =
    match l with
    | [] -> finalOut
    | head::body ->
        let outPut = printList head in
        let compareRes = cmp outPut n in 
        if compareRes = 0 then
          moznostiAux body n (finalOut @ [head])
        else
          moznostiAux body n finalOut
    in 
    moznostiAux list numbers [];;

moznosti [['o';'r';'e';'l'];['o';'p';'i';'c';'a'];['o';'s';'e';'l'];['r';'i';'b';'a']] [6;7;3;5] ;;