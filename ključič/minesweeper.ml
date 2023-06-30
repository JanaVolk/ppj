type korak = Dol | Gor | Levo | Desno;;

(* let premik tuple = function
  | Dol -> (fst tuple, snd tuple - 1)
  | Gor -> (fst tuple, snd tuple + 1)
  | Levo -> (fst tuple - 1, snd tuple)
  | Desno -> (fst tuple + 1, snd tuple);; *)
  (* Useful print Printf.printf "%d\n" var *)

let premik (x,y) = function
  | Dol -> (x, y - 1)
  | Gor -> (x, y + 1)
  | Levo -> (x - 1, y)
  | Desno -> (x + 1, y);;

let rec isTupleInList list tup = 
    match list with
    | [] -> false
    | head::body ->
      if head = tup then
        true
      else
        isTupleInList body tup;;

let rec varna_pot mines startCords endCords moves =
    match moves with
    | [] -> true
    | head::body ->
      let newPos = premik startCords head in
        if isTupleInList mines newPos then
          false
        else
          varna_pot mines newPos endCords body;;

varna_pot [] (0,0) (2,3) [Gor; Desno; Gor; Desno; Gor] ;;
varna_pot [(1,1)] (0,0) (2,3) [Gor; Desno; Gor; Desno; Gor] ;;
varna_pot [(0,2); (1,0); (1,3); (2,1)] (0,0) (2,3) [Gor; Desno; Gor; Desno; Gor] ;;